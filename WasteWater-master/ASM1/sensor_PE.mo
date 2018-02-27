within WasteWater.ASM1;
model sensor_PE "Ideal sensor to measure chemical oxygen demand (COD)"

  Real PE;
  Real T(start = 0.001);
  extends WasteWater.Icons.sensor_COD;
  Modelica.Blocks.Interfaces.RealInput In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}})));
  Modelica.Blocks.Interfaces.RealOutput COD annotation (Placement(
        transformation(extent={{88,-10},{108,10}})));
equation

  der(T) = 1.0;
  der(PE) = (0.004*In+0.008*18446+0.05*385-PE)/T;
  annotation (
    Documentation(info="This component measures the chemical oxygen demand (COD) concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_PE;
