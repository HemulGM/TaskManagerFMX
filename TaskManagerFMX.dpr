program TaskManagerFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  TaskManager.Main in 'TaskManager.Main.pas' {FormMain},
  HGM.ColorUtils in 'DelphiWinUI3\Sources\HGM.ColorUtils.pas',
  WinUI3.Dialogs.DataTransferManager in 'DelphiWinUI3\Sources\WinUI3.Dialogs.DataTransferManager.pas',
  WinUI3.Dialogs in 'DelphiWinUI3\Sources\WinUI3.Dialogs.pas',
  WinUI3.Form.Dialog in 'DelphiWinUI3\Sources\WinUI3.Form.Dialog.pas' {FormDialogs},
  WinUI3.Form in 'DelphiWinUI3\Sources\WinUI3.Form.pas',
  WinUI3.Frame.Dialog.ColorPicker in 'DelphiWinUI3\Sources\WinUI3.Frame.Dialog.ColorPicker.pas' {FrameDialogColorPicker: TFrame},
  WinUI3.Frame.Dialog.Font in 'DelphiWinUI3\Sources\WinUI3.Frame.Dialog.Font.pas' {FrameDialogFont: TFrame},
  WinUI3.Frame.Dialog.Input in 'DelphiWinUI3\Sources\WinUI3.Frame.Dialog.Input.pas' {FrameDialogInput: TFrame},
  WinUI3.Frame.Dialog in 'DelphiWinUI3\Sources\WinUI3.Frame.Dialog.pas' {FrameDialog: TFrame},
  WinUI3.Frame.Dialog.Text in 'DelphiWinUI3\Sources\WinUI3.Frame.Dialog.Text.pas' {FrameDialogText: TFrame},
  WinUI3.Frame.Inner.Dialog in 'DelphiWinUI3\Sources\WinUI3.Frame.Inner.Dialog.pas' {FrameInnerDialog: TFrame},
  WinUI3.Frame.Inner.InfoBar in 'DelphiWinUI3\Sources\WinUI3.Frame.Inner.InfoBar.pas' {FrameInnerInfoBar: TFrame},
  WinUI3.Style in 'DelphiWinUI3\Sources\WinUI3.Style.pas',
  WinUI3.Utils in 'DelphiWinUI3\Sources\WinUI3.Utils.pas',
  FMX.Windows.Dispatch in 'DelphiWinUI3\FMXWindowsDispatch\FMX.Windows.Dispatch.pas',
  FMX.Windows.Hints in 'DelphiWinUI3\FMXWindowsHint\FMX.Windows.Hints.pas',
  FMX.Menus in 'DelphiWinUI3\Fixes\D13\FMX.Menus.pas',
  FMX.Platform.Win in 'DelphiWinUI3\Fixes\D13\FMX.Platform.Win.pas',
  FMX.StyledContextMenu in 'DelphiWinUI3\Fixes\D13\FMX.StyledContextMenu.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDialogs, FormDialogs);
  Application.CreateForm(TFormDialogs, FormDialogs);
  Application.CreateForm(TFormDialogs, FormDialogs);
  Application.Run;
end.
