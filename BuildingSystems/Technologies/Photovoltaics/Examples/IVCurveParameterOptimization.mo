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
    annotation (Placement(transformation(extent={{-24,18},{-32,26}})));
  Modelica.Blocks.Sources.Constant constV(k=12)
    "Module temperature at test conditions";
  Modelica.Blocks.Sources.Ramp increasVoltage(height=pvField.pvModuleData.Ul0,
      duration=pvField.pvModuleData.Ul0)
    "Increasing voltage until open circuit voltage"
    annotation (Placement(transformation(extent={{-24,46},{-32,54}})));
  Modelica.Blocks.Math.MultiSum ISum(k={1,-1}, nu=2)
    annotation (Placement(transformation(extent={{-38,26},{-42,30}})));
  Modelica.Blocks.Math.Product Idiff_sq
    annotation (Placement(transformation(extent={{-46,26},{-50,30}})));
  Modelica.Blocks.Math.Sqrt sqrt1
    annotation (Placement(transformation(extent={{-58,26},{-62,30}})));
  Modelica.Blocks.Continuous.Integrator Idiff_sum
    annotation (Placement(transformation(extent={{-52,26},{-56,30}})));
  Interfaces.GenOptInterface genOptInterface
    annotation (Placement(transformation(extent={{-72,18},{-64,26}})));
equation
  connect(pvField.TAmb, from_degC.y) annotation (Line(
      points={{-44,52},{-44,72},{-51.6,72}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(constTemp.y, from_degC.u) annotation (Line(points={{-67.6,72},{-60.8,
          72}},            color={0,0,127}));
  connect(pvField.radiationPort, constRadiation.radiationPort) annotation (Line(
        points={{-46,52},{-46,52},{-46,60},{-67.2,60}}, color={244,125,35}));
  connect(increasVoltage.y, pvField.UField) annotation (Line(points={{-32.4,50},
          {-32.4,50},{-40,50}}, color={0,0,127}));
  connect(Idiff_sq.u1, ISum.y) annotation (Line(points={{-45.6,29.2},{-44,29.2},
          {-44,28},{-42.34,28}}, color={0,0,127}));
  connect(Idiff_sq.u2, ISum.y) annotation (Line(points={{-45.6,26.8},{-44,26.8},
          {-44,28},{-42.34,28}}, color={0,0,127}));
  connect(pvField.IField, ISum.u[1]) annotation (Line(points={{-40,48},{-36,48},
          {-36,28.7},{-38,28.7}}, color={0,0,127}));
  connect(IVcurve_reference.y, ISum.u[2]) annotation (Line(points={{-32.4,22},{
          -36,22},{-36,27.3},{-38,27.3}}, color={0,0,127}));
  connect(Idiff_sq.y, Idiff_sum.u)
    annotation (Line(points={{-50.2,28},{-51.6,28}}, color={0,0,127}));
  connect(Idiff_sum.y, sqrt1.u)
    annotation (Line(points={{-56.2,28},{-57.6,28}}, color={0,0,127}));
  connect(sqrt1.y, genOptInterface.costFunction) annotation (Line(points={{
          -62.2,28},{-68,28},{-68,25.2}}, color={0,0,127}));
    annotation (Placement(transformation(extent={{-20,68},{-28,76}})),
             Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,100}}), graphics={
    Text(extent={{-60,8},{-60,4}},  lineColor={0,0,255},fontSize=22,
          textString="Model to run with GenOpt to calculate 
optimized PV module parameters.")}),
    experiment(StopTime=22.73),
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
