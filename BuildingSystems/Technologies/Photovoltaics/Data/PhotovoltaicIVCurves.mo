within BuildingSystems.Technologies.Photovoltaics.Data;
package PhotovoltaicIVCurves
  record DataSetIVCurves
    parameter Modelica.SIunits.Temp_K TCel
      "Cell temperature during measurement";
    parameter Real ITot( unit = "W/m2")
      "Effective total solar irradiation on solar cell";
    parameter Modelica.SIunits.Current UI[:,:]
      "Discrete voltage values of the characteristic curve, from 0 to U10 and corresponding current";
  end DataSetIVCurves;

  record SpectraVolt100M36S =    DataSetIVCurves (
    TCel = 25.0,
    ITot = 1000.0,
    UI = [0,5.62;
          0.1,5.62;
          5,5.61;
          10,5.6;
          15,5.58;
          15.4,5.57;
          15.8,5.56;
          16.2,5.55;
          16.6,5.52;
          17,5.49;
          17.4,5.45;
          17.8,5.38;
          18.2,5.3;
          18.6,5.18;
          19,5.02;
          19.4,4.81;
          19.8,4.54;
          20.2,4.18;
          20.6,3.76;
          21,3.24;
          21.4,2.63;
          21.8,1.94;
          22.2,1.16;
          22.6,0.3;
          22.73,0]);
  record SpectraVolt100M36S_50degC =
                                 DataSetIVCurves (
    TCel = 50.0,
    ITot = 1000.0,
    UI = [0,5.69;
          5,5.68;
          10,5.66;
          15,5.61;
          15.4,5.58;
          15.8,5.54;
          16.2,5.49;
          16.6,5.41;
          17,5.30;
          17.4,5.15;
          17.8,4.92;
          18.2,4.65;
          18.6,4.28;
          19,3.81;
          19.4,3.25;
          19.8,2.57;
          20.2,1.79;
          20.6,0.89;
          21,-0.01;
          21.4,-0.01;
          21.8,-0.01;
          22.2,-0.01;
          22.6,-0.01;
          22.74,-0.01]);
end PhotovoltaicIVCurves;
