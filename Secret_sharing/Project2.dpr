program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var m,sp:array[1..300] of word; lm,lsp:word;
  a:array[1..300] of int64;
  mink,maxk1,s:int64;
  i,n,k:word;
function ProvSimple(var simp:word):byte;
var ips:word; ps:byte;
begin
  ps:=1;
  for ips:=2 to round(sqrt(simp))+1 do if simp mod ips=0 then begin ps:=0; break; end;
  provsimple:=ps;
end;

procedure gener;
var ig,ig1:word;
begin
  mink:=1; maxk1:=1;
  randomize;
  ig1:=random(round(110/n))+1;
  m[1]:=sp[ig1];
  for ig:=2 to n do begin ig1:=ig1+random(round(150/n))+1; m[ig]:=sp[ig1]; end;
  for ig:=1 to k do mink:=mink*m[ig];
  for ig:=n downto n-k+2 do maxk1:=maxk1*m[ig];
  s:=random(mink-maxk1-1)+maxk1+1;
  for ig:=1 to n do begin ig1:=random(9)+2; a[ig]:=s+ig1*m[ig]; end;
end;

Procedure SecretSharing;
begin
  gener;
end;

begin
  lsp:=0;
  for i:=50 to 999 do  if provsimple(i)=1 then begin lsp:=lsp+1; sp[lsp]:=i; end;
  assign(input,'p.in'); reset(input); read(n,k); close(input);
  SecretSharing;
  assign(output,'p.out');
  rewrite(output);
    write('m: '); for i:=1 to n do write(m[i],' '); writeln;
    write('min(k): '); writeln(mink);
    write('max(k-1): '); writeln(maxk1);
    write('Secret: '); writeln(s);
    write('a: '); for i:=1 to n do write(a[i],' '); writeln;
  close(output);

end.
