unit VTHelper;

interface

uses
  Vcl.Graphics, VirtualTrees;

procedure AdjustCanvas(Tree: TCustomVirtualStringTree; Node: PVirtualNode;
    ACanvas: TCanvas);
procedure AdjustTreeProperties(Tree: TBaseVirtualTree);

implementation

uses
  SpTBXSkins;

type
  TTreeAccess = class(TBaseVirtualTree);

procedure AdjustCanvas(Tree: TCustomVirtualStringTree; Node: PVirtualNode;
    ACanvas: TCanvas);
begin
  if (vsSelected in Node.States) then  // Good option but does not cover Carbon
  begin
    if SkinManager.GetSkinType in [{sknSkin,} sknDelphiStyle] then
    begin
      ACanvas.Font.Color := CurrentSkin.GetTextColor(skncListItem,
        CurrentSkin.GetState(True, False, False, True));
      if not Tree.Focused then
        ACanvas.Font.Color := clBlack;
    end;
  end;
end;

procedure AdjustTreeProperties(Tree: TBaseVirtualTree);
begin
  TTreeAccess(Tree).Colors.UnfocusedSelectionColor := clInactiveBorder;
end;

end.
