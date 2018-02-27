within WasteWater.ASM1;
model sensor_EQ "Ideal sensor to measure chemical oxygen demand (COD)"

  Real BOD;
  Real SS;
  Real Snkj;
  Real EQ;
  Real T(start=0.001);
  extends WasteWater.Icons.sensor_COD;
  Interfaces.WWFlowAsm1in In annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}})));
  Modelica.Blocks.Interfaces.RealOutput COD annotation (Placement(
        transformation(extent={{88,-10},{108,10}})));
equation

  In.Q = 0.0;
  COD = In.Si + In.Ss + In.Xi + In.Xs + In.Xbh + In.Xba + In.Xp;
  BOD = 0.25*(In.Ss + In.Xs + (1 - 0.08)*(In.Xbh + In.Xba));
  SS = 0.75*(In.Xs + In.Xi + In.Xbh + In.Xba + In.Xp);
  Snkj = In.Snh + In.Snd + In.Xnd + 0.008*(In.Xbh + In.Xba) + 0.06*(In.Xp + In.Xi);
  der(T) = 1.0;
  der(EQ) = -1/T*EQ + 1/(1000*T) * (2*SS + 1*COD + 30*Snkj + 10*In.Sno + 2*BOD)*18061;

  annotation (
    Documentation(info="This component measures the chemical oxygen demand (COD) concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"));
end sensor_EQ;
