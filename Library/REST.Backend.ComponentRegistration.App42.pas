unit REST.Backend.ComponentRegistration.App42;

interface

uses
  System.Classes;

procedure Register;

implementation

uses
  REST.Backend.App42Provider;

procedure Register;
begin
  RegisterComponents('BAAS Client', [TApp42Provider]);
end;

end.
