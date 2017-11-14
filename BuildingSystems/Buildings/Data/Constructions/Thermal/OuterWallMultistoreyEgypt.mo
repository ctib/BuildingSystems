within BuildingSystems.Buildings.Data.Constructions.Thermal;
record OuterWallMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=3,
  thickness={0.005,0.24,0.005},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster()})
  "Outer wall construction for a typical egyptian multistorey building (based on S. Attia, 2012)";
