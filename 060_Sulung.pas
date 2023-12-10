uses crt, sysutils;

const   
    maks = 100;

type 
    matkul = record
        nama_matkul : string;
        sks         : integer;
    end;

    mahasiswa = record
        ingfonama   : string;
        nim         : string;
        nilaihuruf  : array [1..maks] of string;
        nilaiangka  : real;
        ip          : real;
    end;

var
    jmlmatkul       : array[1..maks] of matkul;
    ingfomahasiswa  : mahasiswa;
    nmatkul         : integer;
    i,j             : integer;
    totalsks        : real;
    panjang         : integer;
    filee           : TextFile;


function convertnilai(nilaihuruf:string;sks:real):real;
    var
        nilai       : real;

    begin
        nilaihuruf:=uppercase(nilaihuruf);
        case (nilaihuruf) of
            'A'     : nilaihuruf := '4';
            'B+'    : nilaihuruf := '3,5';
            'B'     : nilaihuruf := '3';
            'C+'    : nilaihuruf := '2,5';
            'C'     : nilaihuruf := '2';
            'D'     : nilaihuruf := '1';
            'E'     : nilaihuruf := '0';
        end;
        nilai       := StrToFloat(nilaihuruf) * sks;
        convertnilai:= nilai;
    end;

begin
    clrscr;
    totalsks                    := 0;
    ingfomahasiswa.nilaiangka   := 0;

    write('Jumlah Mata Kuliah : ');
    readln(nmatkul);

    for i:= 1 to nmatkul do
        begin
            clrscr;
            write('Nama mata kuliah ',i,' : ');
            readln(jmlmatkul[i].nama_matkul);
            write('Jumlah SKS         : ');
            readln(jmlmatkul[i].sks);
            totalsks:= totalsks + jmlmatkul[i].sks;
        end;

    clrscr;
    write('Nama Mahasiswa   : ');
    readln(ingfomahasiswa.ingfonama);
    write('NIM              : ');
    readln(ingfomahasiswa.nim);
    clrscr;

    writeln('Input Nilai Huruf Mata Kuliah');
    writeln;
    for i:= 1 to nmatkul do
        begin
            write('Nilai ',jmlmatkul[i].nama_matkul,' : ');
            readln(ingfomahasiswa.nilaihuruf[i]);
            if panjang>0 then 
                begin
                    panjang := length(ingfomahasiswa.nilaihuruf[i]); 
                end;
            ingfomahasiswa.nilaiangka := ingfomahasiswa.nilaiangka + convertnilai(ingfomahasiswa.nilaihuruf[i],jmlmatkul[i].sks);
        end;

    ingfomahasiswa.ip := ingfomahasiswa.nilaiangka / totalsks;

    clrscr;
    assign(filee,'KHS_231401060_Sulung Ismanara.txt');
    rewrite(filee);
        writeln(filee, 'Kartu Hasil Studi');
        writeln(filee, '==================================');
        writeln(filee);
        writeln(filee, 'Nama : ',ingfomahasiswa.ingfonama);
        writeln(filee, 'NIM  : ',ingfomahasiswa.nim);
        writeln(filee);
        writeln(filee, '|=======================================================|');
        writeln(filee, '|No |Matkul                                       |Nilai|'); 
        writeln(filee, '|=======================================================|');

        for i:= 1 to nmatkul do
        begin
            write(filee, '|',i,'. |',jmlmatkul[i].nama_matkul);
                for j := 1 to (45 + panjang - length(jmlmatkul[i].nama_matkul)) do 
                    begin
                        write(filee, ' '); 
                    end;

            write(filee, '|',ingfomahasiswa.nilaihuruf[i]);
                for j := 1 to (5 - length(ingfomahasiswa.nilaihuruf[i])) do 
                    begin
                        write(filee, ' '); 
                    end;
            write(filee, '|');
            writeln(filee);
        end;

        writeln(filee, '|=======================================================|');
        writeln(filee);
        writeln(filee, 'Total SKS   : ',totalsks:0:0);
        writeln(filee, 'IP Semester : ',ingfomahasiswa.ip:0:2);
    close(filee);
end.

    
