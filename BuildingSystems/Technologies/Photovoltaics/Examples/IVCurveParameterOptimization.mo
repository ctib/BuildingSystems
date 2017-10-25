within BuildingSystems.Technologies.Photovoltaics.Examples;
model IVCurveParameterOptimization
  "Example to optimize PV Module paramters (Rser, Rpar, c1, c2, cs1, cs2) with GenOpt"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleComplex pvField(
    angleDegAzi_constant=0.0,
    nModPar=1,
    nModSer=1,
    angleDegTil_constant=0,
    redeclare Data.PhotovoltaicModules.SpectraVolt100M36S pvModuleData)
    annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicIVCurves.SpectraVolt100M36S IVcurve_ref
     "measured IV curve from data";
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-60,68},{-52,76}})));
  Climate.Sources.RadiationFixed constRadiation(IrrDir_constant=IVcurve_ref.ITot)
    "direct horizontal radiation on module surface"
    annotation (Placement(transformation(extent={{-80,52},{-64,68}})));
  Modelica.Blocks.Sources.Constant constTemp(k=IVcurve_ref.TCel)
    "Module temperature at test conditions"
    annotation (Placement(transformation(extent={{-76,68},{-68,76}})));
  Modelica.Blocks.Sources.TimeTable IVcurve_reference(table=IVcurve_ref.UI)
    annotation (Placement(transformation(extent={{-22,62},{-30,70}})));
  Modelica.Blocks.Sources.Constant constV(k=12)
    "Module temperature at test conditions";
  Modelica.Blocks.Sources.Ramp increasVoltage(height=pvField.pvModuleData.Ul0,
      duration=pvField.pvModuleData.Ul0)
    "Increasing voltage until open circuit voltage"
    annotation (Placement(transformation(extent={{-22,46},{-30,54}})));
    annotation (Placement(transformation(extent={{-20,68},{-28,76}})));
equation
  connect(pvField.TAmb, from_degC.y) annotation (Line(
      points={{-44,52},{-44,72},{-51.6,72}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(constTemp.y, from_degC.u) annotation (Line(points={{-67.6,72},{-60.8,
          72}},            color={0,0,127}));
  connect(pvField.radiationPort, constRadiation.radiationPort) annotation (Line(
        points={{-46,52},{-46,52},{-46,60},{-67.2,60}}, color={244,125,35}));
  connect(increasVoltage.y, pvField.UField) annotation (Line(points={{-30.4,50},
          {-35.2,50},{-40,50}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,100}}), graphics={
    Text(extent={{-60,22},{-60,18}},lineColor={0,0,255},fontSize=22,
          textString="Model to run with GenOpt to calculate 
optimized PV module parameters.")}),
    experiment(StopTime=23),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Technologies/Photovoltaics/Examples/PVModuleParameterOpt.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Photovoltaics.PVModuleComplex\">
BuildingSystems.Technologies.Photovoltaics.PVModuleComplex</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
March 7, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end IVCurveParameterOptimization;
