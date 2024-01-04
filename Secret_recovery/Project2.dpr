program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;
var a,MMM,NN:array[1..300] of int64;
    m:array[1..300] of word;
    MM,s,mink,maxk1:int64;
    i,k:word;
	
procedure evkl(ae,be: int64; var nod, xe,ye:int64);
var x2,y2,x1,y1,q1,r1:int64;
begin
  x1:=0;x2:=1; y1:=1; y2:=0;
  if be=0 then begin nod:=ae; xe:=1; ye:=0; end
  else begin
  while be>0 do
  begin
    q1:=ae div be; r1:=ae-q1*be;
    xe:=x2-q1*x1; ye:=y2-q1*y1;
    ae:=be; be:=r1;
    x2:=x1; x1:=xe; y2:=y1; y1:=ye;
  end;
  nod:=ae; xe:=x2; ye:=y2;
  end;
end;

procedure SecretRecovery;
var iv:word; iv1,iv2: int64;
begin
  MM:=1; s:=0;
  for iv:=1 to k do MM:=MM*m[iv];
  for iv:=1 to k do MMM[iv]:=round(MM/m[iv]);
  for iv:=1 to k do
  begin
    evkl(MMM[iv],m[iv],iv1,NN[iv],iv2);
 
  end;
  for iv:=1 to k do s:=s+a[iv]*MMM[iv]*NN[iv];


  while not((s>maxk1) and (s<mink)) do
  begin
    if s<maxk1 then s:=s+MM;
    if s>mink then s:=s-MM;
  end;

end;
begin
  assign(input,'secret.in');
  reset(input);
    readln(k);
    readln(mink,maxk1);
    for i:=1 to k do read(m[i]); readln;
    for i:=1 to k do read(a[i]);
  close(input);
  SecretRecovery;
  assign(output,'secret.out');
  rewrite(output);
    writeln(s);
  close(output);

end.
