within BuildingSystems.Buildings.Data.Constructions.Thermal;
record RoofMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=3,
  thickness={0.01,0.24,0.01},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.ConcreteEgyptian(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone()})
  "Roof construction for typical egyptian multistorey building  (based on S.Attia, 2012)";
