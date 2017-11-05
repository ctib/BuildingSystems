within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record LimeSandStone =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=7,
    name="Calcium silicate brick (Kalksandstein)",
    rho=1900.0,
    c=1000,
    sorTabX={0.0,0.5,0.65,0.8,0.9,1},
    sorTabY={0.0,0.17,0.18,0.249,0.402,2.5},
    myTabX={0.0,1.0},
    myTabY={28.0,28.0},
    lambdaTabX={0.0,290.0},
    lambdaTabY={1.0,1.933},
    dwwTabX={0.0,3.1,188.0},
    dwwTabY={0.0,2.4e-9,3.6e-7},
    dwsTabX={0.0,3.1,188.0},
    dwsTabY={0.0,4.0e-9,3.6e-6},
    lambdaDry=1.0,
    w80=-999,
    w95=-999,
    wF=250.0,
    porosity=0.29,
    A=2.7,
    myDry=28.0,
    myMoistF=-999,
    moistSup=-999) "Calcium silicate brick (Kalksandstein)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
