uses crt;
var
    n, m : integer;
    X,energi, kabel, kenamusuh, jumlahenergi, bonusbuff : real;
    Buff : string;

begin
clrscr;

    write('Jumlah Kabel yang digunakan : ');
    readln(n);
    write('Jumlah Musuh : ');
    readln(m);
    write('Jumlah energi : ');
    readln(x);
    write('Buff (TRUE/FALSE) : ');
    readln(Buff);
    Buff:=upcase(buff);

    if Buff = 'TRUE' then
        begin
            energi := x/2;
            bonusbuff := 15/2
        end
    else
        begin
            energi := x; 
            bonusbuff := 15
        end;
    
    kabel:=n*energi;
    kenamusuh:=m*(bonusbuff-8);
    jumlahenergi:=kabel+kenamusuh;
    writeln(jumlahenergi:4:2);

end.