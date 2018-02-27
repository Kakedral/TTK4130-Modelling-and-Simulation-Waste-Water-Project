within WasteWater.ASM1;
model sensor_COD "Ideal sensor to measure chemical oxygen demand (COD)"

  extends WasteWater.Icons.sensor_COD;
  Interfaces.WWFlowAsm1in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}})));
  Modelica.Blocks.Interfaces.RealOutput COD annotation (Placement(
        transformation(extent={{88,-10},{108,10}})));
equation

  In.Q = 0.0;
  COD = In.Si + In.Ss + In.Xi + In.Xs + In.Xbh + In.Xba + In.Xp;

  annotation (
    Documentation(info="This component measures the chemical oxygen demand (COD) concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_COD;
