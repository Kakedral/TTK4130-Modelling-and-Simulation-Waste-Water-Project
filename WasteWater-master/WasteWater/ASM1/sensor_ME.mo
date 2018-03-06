within WasteWater.ASM1;
model sensor_ME
  "Ideal sensor to measure dissolved oxygen concentration"

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

  Real ME(start=0);
  Real T(start=1e-3);
  Real f1, f2, f3;

equation
  if (Kla3<20) then
    f1 = 1;
  else
    f1 = 0;
  end if;
  if (Kla4<20) then
    f2 = 1;
  else
    f2 = 0;
  end if;
  if (Kla5<20) then
    f3 = 1;
  else
    f3 = 0;
  end if;

  der(T) = 1.0;
  der(ME) = (-ME/T) + (24/T)*(f1*1333 + f2*1333 + f3*1333 + 2*1000)*0.005;
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
        Text(extent={{-36,-22},{36,-44}},
          textString="Aer
",        lineColor={0,0,0}),
        Line(
          points={{0,-50},{0,-90}},
          thickness=0.5),
        Line(points={{50,0},{88,0}}),
        Text(extent={{-80,100},{80,60}}, textString=
                                             "%name"),
        Line(
          points={{40,-30},{40,-90}},
          thickness=0.5),
        Line(
          points={{-40,-30},{-40,-90}},
          thickness=0.5)}));
end sensor_ME;
