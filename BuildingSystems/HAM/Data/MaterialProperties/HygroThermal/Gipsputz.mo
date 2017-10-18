within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Gipsputz =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=1,
    name="Gipsputz",
    rho=1721.0,
    c=850,
    sorTabX={0.0,0.5,0.7,0.8,0.9,0.95,0.99,0.994,0.999,0.9996971,0.9998089,
        0.999879,1.0},
    sorTabY={0.0,0.89,1.37,1.8,2.5,3.4,6.65,8.65,27.0,46.0,70.4,242.435,264.27},
    myTabX={0.0,0.5,0.8,0.9,0.95},
    myTabY={13.0,11.9,10.45,8.19,5.22},
    lambdaTabX={0.0,264.27},
    lambdaTabY={0.2,0.299},
    dwwTabX={0.0,2.51,3.42,6.65,8.65,11.2,14.82,19.02,41.79,70.79,194.39,242.43,
        264.27},
    dwwTabY={1.0e-16,4.63e-9,2.941e-9,2.06e-9,2.11e-9,2.24e-9,2.49e-9,2.83e-9,
        5.66e-9,1.35e-8,5.91e-7,2.55e-6,4.96e-6},
    dwsTabX={0.0,2.51,3.42,6.65,8.65,11.2,14.82,19.02,41.79,70.79,194.39,242.43,
        264.27},
    dwsTabY={1.0e-16,4.63e-9,2.941e-9,2.06e-9,2.11e-9,2.24e-9,2.49e-9,2.83e-9,
        5.66e-9,1.35e-8,5.91e-7,2.55e-6,4.96e-6},
    lambdaDry=0.2,
    w80=1.8,
    w95=3.4,
    wF=264.0,
    porosity=0.31,
    A=0.303,
    myDry=13.0,
    myMoistF=13.0,
    moistSup=8.0);

