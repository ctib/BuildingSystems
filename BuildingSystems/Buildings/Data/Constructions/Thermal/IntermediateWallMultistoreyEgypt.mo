within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateWallMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=3,
  thickness={0.025,0.24,0.025},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster()})
  "Intermediate wall construction for typical egyptian multistorey (based on S.Attia, 2012)";
