within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateWallMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction
    (
  final nLayers=3,
  thickness={0.025,0.24,0.025},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimeSandStone(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster()})
  "Intermediate wall construction for typical egyptian multistorey (based on S.Attia, 2012)";
