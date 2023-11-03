uses crt;
var 
    n, i, total, jumlah : integer;

begin
clrscr;
    
    write('Masukkan Bilangan ');
    readln(n);
    total := 0;
    jumlah := 0;

    for i := n downto 1 do 
        begin
            if (i mod 3 = 0) and (i mod 2 = 1) then
                begin
                    write(i, ' ');
                    total+=i;
                    jumlah+=1;
                end;
        end;
    
    writeln();
    writeln(jumlah);
    writeln(total);

end.
