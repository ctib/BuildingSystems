within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateCeilingEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=3,
  thickness={0.02,0.3,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster()})
  "Intermediate ceiling construction for an egyptian building";
