within WasteWater.ASM1;
model sensor_EQ_old "Ideal sensor to measure dissolved oxygen concentration"

  extends WasteWater.Icons.sensor_O2;
  Modelica.Blocks.Interfaces.RealInput Kla3 annotation (Placement(transformation(extent={{-10,-10},
            {10,10}},
        rotation=-90,
        origin={-40,-90})));
  Modelica.Blocks.Interfaces.RealInput Kla4 annotation (Placement(transformation(extent={{-10,-10},
            {10,10}},
        rotation=-90,
        origin={0,-90})));
  Modelica.Blocks.Interfaces.RealInput Kla5 annotation (Placement(transformation(extent={{-10,-10},
            {10,10}},
        rotation=-90,
        origin={40,-90})));

  Real AE(start=0);
  Real T(start=1e-3);

equation
  COD_e = 0.889;
  der(EQ) = -1/15*EQ+1/(1000*15)*(2*0.889+1*COD_e);
  //der(EQ) = -1/T*EQ+1/(1000*T)(B_ss*SS_e+B_COD*COD_e+B_Nkj*S_Nkj+B_NO*S_NO+B_BOD*BOD_e)*Q_e

  annotation (
    Documentation(info="This component measures the dissolved oxygen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={223,223,159},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,50},{0,38}},
          thickness=0.5),
        Line(
          points={{-50,0},{38,0}},
          thickness=0.5),
        Line(
          points={{50,0},{38,0}},
          thickness=0.5),
        Line(
          points={{-36,34},{-28,26}},
          thickness=0.5),
        Line(
          points={{34,36},{26,28}},
          thickness=0.5),
        Line(
          points={{0,0},{26,28}},
          thickness=0.5),
        Polygon(
          points={{30,32},{10,24},{24,12},{30,32}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(extent={{-36,-10},{36,-32}}, textString=
                                              "EQ"),
        Line(
          points={{0,-50},{0,-90}},
          thickness=0.5),
        Line(points={{50,0},{88,0}}),
        Text(extent={{-80,100},{80,60}}, textString=
                                             "%name")}));
end sensor_EQ_old;
