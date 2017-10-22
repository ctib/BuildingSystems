within BuildingSystems.Technologies.Photovoltaics.Examples;
model IVCurveGeneration
  "Example to create IV curves for PV modules at constant radiation"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleComplex pvField(
    angleDegAzi_constant=0.0,
    redeclare Data.PhotovoltaicModules.SpectraVolt100M36S pvModuleData,
    nModPar=1,
    nModSer=1,
    angleDegTil_constant=0)
    annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-60,68},{-52,76}})));
  Modelica.Blocks.Sources.Ramp increasVoltage(height=pvField.pvModuleData.Ul0,
      duration=pvField.pvModuleData.Ul0)
    "Increasing voltage until open circuit voltage"
    annotation (Placement(transformation(extent={{-26,46},{-34,54}})));
  Climate.Sources.RadiationFixed constRadiation(IrrDir_constant=1000)
    "direct horizontal radiation on module surface"
    annotation (Placement(transformation(extent={{-80,52},{-64,68}})));
  Modelica.Blocks.Sources.Constant constTemp(k=25)
    "Module temperature at test conditions"
    annotation (Placement(transformation(extent={{-76,68},{-68,76}})));
equation
  connect(pvField.TAmb, from_degC.y) annotation (Line(
      points={{-44,52},{-44,72},{-51.6,72}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(increasVoltage.y, pvField.UField) annotation (Line(points={{-34.4,50},
          {-34.4,50},{-40,50}}, color={0,0,127}));

  connect(constTemp.y, from_degC.u) annotation (Line(points={{-67.6,72},{-60.8,
          72},{-60.8,72}}, color={0,0,127}));
  connect(pvField.radiationPort, constRadiation.radiationPort) annotation (Line(
        points={{-46,52},{-46,52},{-46,60},{-67.2,60}}, color={244,125,35}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,100}}), graphics={
    Text(extent={{-60,22},{-60,18}},lineColor={0,0,255},fontSize=18,
          textString="IV curve generator for single selected module 
(with 2 diode model)
at constant temperature 
and direct horizontal radiation
")}),
    experiment(StartTime=0.0, StopTime=3.1536e+007),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/Photovoltaics/Examples/PVModuleComplex.mos" "Simulate and plot"),
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
end IVCurveGeneration;
