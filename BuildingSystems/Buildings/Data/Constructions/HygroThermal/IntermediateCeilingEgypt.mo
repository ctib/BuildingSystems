within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateCeilingEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction
    (
  final nLayers=3,
  thickness={0.01,0.17,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster()})
  "Intermediate ceiling construction for an egyptian building";
