within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateWallMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=3,
  thickness={0.026,0.22,0.026},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.BrickEgyptian(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster()})
  "Intermediate wall construction for typical egyptian multistorey (based on S.Attia, 2012)";
