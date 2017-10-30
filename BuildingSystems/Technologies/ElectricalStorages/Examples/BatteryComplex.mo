within BuildingSystems.Technologies.ElectricalStorages.Examples;
model BatteryComplex "Example of the extended electrical battery model"
  import BuildingSystems;
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.ElectricalStorages.BatteryLeadAcid battery(
      redeclare
      BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid.LeadAcidGeneric
      batteryData, nBat=1)
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  Modelica.Blocks.Sources.Pulse gain(
    width=50,
    period=7200,
    amplitude=200)
    annotation (Placement(transformation(extent={{-84,56},{-76,64}})));
  Modelica.Blocks.Sources.Pulse load(
    period=2400,
    width=10,
    amplitude=8640)
             annotation (Placement(transformation(extent={{-36,56},{-44,64}})));
equation
  connect(battery.PCharge, gain.y) annotation (Line(
      points={{-65,60},{-75.6,60}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(load.y, battery.PLoad)
    annotation (Line(points={{-44.4,60},{-55,60}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},
  {-20,100}}), graphics={
    Text(extent={{-60,22},{-60,18}},lineColor={0,0,255},fontSize=22,
          textString="Test of the extended kinetic battery model KiBaM")}),
    experiment(StopTime=14400),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Technologies/ElectricalStorages/Examples/BatteryComplex.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Electrica.Batteries\">
BuildingSystems.Technologies.Electrical.Batteries</a>.
</p>
</html>", revisions="<html>
<ul>
  <li>
June 16, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end BatteryComplex;
