uses crt;
var 
    d, t, alas, vol, selimut, LuasPermukaan : extended;
const 
    pi = 3.1416;

begin
clrscr;
    write('Diameter : ');
    readln(d);
    write('Tinggi : ');
    readln(t);

    alas := ((d/2)*(d/2))*pi;
    vol := alas*t;
    selimut := pi*d*t;
    LuasPermukaan := (2*alas)+selimut;
    
    writeln(vol:4:4);
    writeln(LuasPermukaan:4:4);
end.