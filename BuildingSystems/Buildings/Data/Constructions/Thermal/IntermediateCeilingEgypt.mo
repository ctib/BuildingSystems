within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateCeilingEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=3,
  thickness={0.01,0.17,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.ConcreteEgyptian(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone()})
  "Intermediate ceiling construction for an egyptian building";
