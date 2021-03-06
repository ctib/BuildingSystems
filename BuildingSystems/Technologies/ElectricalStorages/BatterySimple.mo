within BuildingSystems.Technologies.ElectricalStorages;
model BatterySimple

  input BuildingSystems.Interfaces.PowerInput PCharge
    "Power of the electrical source"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}}),                                                                                                    iconTransformation(extent={{-60,-10},{-40,10}})));
  input BuildingSystems.Interfaces.PowerInput PLoad
    "Power of the electrical load"
    annotation (Placement(transformation(extent={{-18,-18},{18,18}},rotation=180,origin={60,0}), iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={50,0})));
  output Modelica.Blocks.Interfaces.RealOutput SOC
    "State of charge"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,64}), iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,54})));
  output BuildingSystems.Interfaces.PowerOutput PGrid
    "Electricity taken from the grid"
    annotation (Placement(transformation(extent={{54,30},{74,50}}), iconTransformation(extent={{44,30},{64,50}})));
  replaceable parameter BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral batteryData
    "Characteristic data of the battery"
    annotation(Dialog(tab = "General"),Evaluate=true, choicesAllMatching=true);
  parameter Integer nBat(min = 1) = 1
    "Number of batteries"
    annotation(Dialog(tab = "General"));
  final parameter Modelica.SIunits.Energy E_nominal(displayUnit="kWh") = nBat*batteryData.E_nominal
    "Nominal capacity of all batteries";
  final parameter Modelica.SIunits.Efficiency etaCharge = batteryData.etaCharge
    "Charge efficiency";
  final parameter Modelica.SIunits.Efficiency etaLoad = batteryData.etaLoad
    "Load efficiency";
  final parameter Real SOC_min = batteryData.SOC_min
    "Minimal accepted charge level";
  final parameter Modelica.SIunits.Power PLoad_max = nBat*batteryData.PLoad_max
    "Maximal discharging power of battery";
  final parameter Modelica.SIunits.Power PCharge_max = nBat*batteryData.PCharge_max
    "Maximal charging power of battery";
  final parameter Real fDis(unit="1/s") = batteryData.fDis
    "Loss factor of the battery";
  parameter Real SOC_start = 0.5
    "Start charge level of the battery"
    annotation (Dialog(tab="Initialization"));
  final parameter Real c(unit="1") = batteryData.c
    "Capacity relation available to bound energy";
  final parameter Real kstar(unit="1/s") = batteryData.kstar
    "Battery rate";
  Modelica.SIunits.Power PChargeEff
    "Effective power of the electrical source";
  Modelica.SIunits.Power PLoadEff
    "Effective power of the electrical load";
  Modelica.SIunits.Energy EAva(
    displayUnit="kWh",
    start = c*SOC_start*E_nominal)
    "Available charge of the battery";
  Modelica.SIunits.Energy EBou(
    displayUnit="kWh",
    start = (1.0-c)*SOC_start*E_nominal)
    "Bound charge of the battery";
  Modelica.SIunits.Energy E(
    displayUnit="kWh",
    start = E_nominal * SOC_start)
    "Total charge of the battery";
protected
  final parameter Real k(unit="1/s") = c*(1-c)*kstar;
  Modelica.SIunits.Energy h1
    "Helping variable 1";
  Modelica.SIunits.Energy h2
    "Helping variable 2";
  Modelica.SIunits.Power PNet
    "Net power for charging (> 0.0 W) or discharging (< 0.0 W)";
equation
  h1 = EAva/c;
  h2 = EBou/(1-c);
  der(EAva) = PChargeEff - PLoadEff + k*(h2 - h1);
  der(EBou) = -k*(h2 - h1) - fDis * E;
  E = EAva + EBou;
  SOC = E / E_nominal;

  PNet = PCharge - PLoad;

  PChargeEff = if PNet > 0.0 and EAva > c*E_nominal then k*(h2-h1)
               elseif PNet > 0.0 and EAva <= c*E_nominal then 0.5 * (1.0 - Modelica.Math.tanh(100000.0*(SOC-1.0)))
                 * BuildingSystems.Utilities.SmoothFunctions.softcut_upper(PNet*etaCharge,PCharge_max,0.001)
               else 0.0;

  PLoadEff = if PNet <= 0.0 and EAva < 0.0 then k*(h2-h1)
             elseif PNet <= 0.0 and EAva >= 0.0 then 0.5 * (1.0 + Modelica.Math.tanh(100000.0*(SOC-1.1*SOC_min)))
               * BuildingSystems.Utilities.SmoothFunctions.softcut_upper(-PNet/etaLoad,PLoad_max,0.001)
            else 0.0;

  PGrid = if PNet > 0.0 then PNet - PChargeEff/etaCharge
    else PNet + PLoadEff*etaLoad;
    annotation (defaultComponentName="battery", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
      Rectangle(extent={{-60,60},{60,-60}},
        lineColor={215,215,215},
        fillColor={215,215,215},
        fillPattern=FillPattern.Solid),
      Text(extent={{-40,-62},{44,-96}},
        lineColor={0,0,255},
        textString="%name"),
        Rectangle(
          extent={{-20,32},{20,-52}},
          fillColor={128,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-20,-52},{20,-56}},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-6,36},{6,32}},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}),
        defaultComponentName="bat",
  Documentation(info="<html>
  <p>
  Model for an eletrical battery based on the Kinetic Battery Model (KiBaM) of Manwell and McGowan
  (J. Manwell, J. McGowan, B.-G. E.I., S. W., and L. A., Evaluation of battery models
   for wind/hybrid power system simulation, in Proceedings of the 5th European Wind
   Energy Association Conference (EWEC ’94), 1994, pp. 1182–1187.).
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  November 11, 2017, by Christoph Nytsch-Geusen:<br/>
  Loss factor to bound energy storage shifted and plausible
  limitations of PChargeEff and PLoadEff added.
  </li>
  <li>
  May 31, 2017, by Christoph Nytsch-Geusen:<br/>
  Integration of the Kinetic Battery Model.
  </li>
  <li>
  June 6, 2016, by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end BatterySimple;
