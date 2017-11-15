within BuildingSystems.Applications.BuildingTypes.Egypt;
model MultistoreyApartmentBuilding
  "Example of a typical Egyptian multistorey building with multiple apartments per floor"
  extends Modelica.Icons.Example;

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient, redeclare
      Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna
      weatherDataFile)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

  BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DDistrict building(
    calcIdealLoads=true,
    heightSto=2.7,
    nSto=12,
    redeclare Buildings.Data.Constructions.Thermal.OuterWallMultistoreyEgypt
      constructionWall1,
    redeclare Buildings.Data.Constructions.Thermal.OuterWallMultistoreyEgypt
      constructionWall2,
    redeclare Buildings.Data.Constructions.Thermal.OuterWallMultistoreyEgypt
      constructionWall3,
    redeclare Buildings.Data.Constructions.Thermal.OuterWallMultistoreyEgypt
      constructionWall4,
    redeclare Buildings.Data.Constructions.Thermal.RoofMultistoreyEgypt
      constructionCeiling,
    redeclare Buildings.Data.Constructions.Thermal.BasePlateMultistoreyEgypt
      constructionBottom,
    redeclare
      Buildings.Data.Constructions.Thermal.IntermediateWallMultistoreyEgypt
      constructionWallsInterior,
    redeclare Buildings.Data.Constructions.Thermal.IntermediateCeilingEgypt
      constructionCeilingsInterior,
    widthWindow1=11.9,
    heightWindow1=18,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow1,
    widthWindow2=6.8,
    heightWindow2=18,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow2,
    widthWindow3=11.9,
    heightWindow3=18,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow3,
    widthWindow4=6.8,
    heightWindow4=28,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow4,
    width=29.08,
    length=17.52)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,14})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,6})));

  Modelica.Blocks.Sources.Constant airchange(k=0.171)
     annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,-2})));
equation
   connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (Line(
    points={{-22,4},{-9,4}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
    points={{-22,-4},{-9,-4}},
    color={85,170,255},
    smooth=Smooth.None));
  connect(TSetHeating.y, building.T_setHeating[1]) annotation (Line(
      points={{15.8,14},{12,14},{12,8},{9.8,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, building.T_setCooling[1]) annotation (Line(
      points={{15.8,6},{9.8,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.TAirAmb, ambient.TAirRef) annotation (Line(
      points={{6.2,9.8},{6.2,12},{-40,12},{-40,7},{-39,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.xAirAmb, ambient.xAir) annotation (Line(
      points={{8.4,9.8},{8.4,14},{-42,14},{-42,5},{-39,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.airchange[1], airchange.y) annotation (Line(
      points={{9.8,4},{12,4},{12,-2},{15.8,-2}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StopTime=3.1536e+007, __Dymola_NumberOfIntervals=8760),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Applications/BuildingTypes/Egypt/MultistoreyBuildingEgypt.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{
              -52,-16},{52,-84}},                                                                                               lineColor=
              {0,0,255},
          textString="Example of a typical Egyptian multistorey building based on
 \"Benchmark models for the Egyptian residential sector\" by S. Attia et al (2012)")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the energy demand of a typical German multistorey building from 1958 to 1968 based on IWU building typology.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end MultistoreyApartmentBuilding;
