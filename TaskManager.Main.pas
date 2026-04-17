unit TaskManager.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, WinUI3.Form,
  FMX.Objects, FMX.StdCtrls, FMX.ListBox, FMX.Layouts, FMX.Edit,
  FMX.Controls.Presentation, FMX.Menus, FMX.MultiView, FMX.TabControl;

type
  TFormMain = class(TWinUIForm)
    LayoutHead: TLayout;
    LayoutCaption: TLayout;
    EditSearch: TEdit;
    ClearEditButton4: TClearEditButton;
    PopupSearch: TPopup;
    ListBoxSearch: TListBox;
    ListBoxItem125: TListBoxItem;
    ButtonWinMin: TButton;
    ButtonWinMax: TButton;
    ButtonWinClose: TButton;
    LabelTitle: TLabel;
    LayoutIcon: TLayout;
    ImageIcon: TImage;
    PanelClient: TPanel;
    StyleBookWinUI3: TStyleBook;
    StyleBookWinUI3Light: TStyleBook;
    LayoutTitleMenuButton: TLayout;
    LayoutMenu: TLayout;
    PanelMenu: TPanel;
    RadioButtonSettings: TRadioButton;
    LayoutMenuLayer: TLayout;
    Button80: TButton;
    PanelDiv1: TPanel;
    VertScrollBoxMenuItems: TVertScrollBox;
    RadioButtonPerfomance: TRadioButton;
    RadioButtonProcesses: TRadioButton;
    RadioButtonAutorun: TRadioButton;
    RadioButtonJournal: TRadioButton;
    RadioButtonDetails: TRadioButton;
    RadioButtonServices: TRadioButton;
    LayoutMenuOffset: TLayout;
    LayoutOverMenuButton: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    ButtonMasterMenu: TButton;
    LayoutSearchBar: TLayout;
    ButtonSearch: TButton;
    TabControlMain: TTabControl;
    TabItemSettings: TTabItem;
    TabItemProcesses: TTabItem;
    Layout1: TLayout;
    VertScrollBox2: TVertScrollBox;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Layout23: TLayout;
    Panel32: TPanel;
    Label68: TLabel;
    Label69: TLabel;
    PathLabel5: TPathLabel;
    ComboBoxTheme: TComboBox;
    ExpanderWindowMan: TExpander;
    Label3: TLabel;
    CheckBoxOnTop: TCheckBox;
    RadioButtonUsers: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure Button80Click(Sender: TObject);
    procedure ButtonShowMenuClick(Sender: TObject);
    procedure LayoutMenuClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ClearEditButton4Click(Sender: TObject);
    procedure EditSearchExit(Sender: TObject);
    procedure LayoutHeadResize(Sender: TObject);
    procedure ComboBoxThemeChange(Sender: TObject);
    procedure ChangeMenuItem(Sender: TObject);
    procedure CheckBoxOnTopChange(Sender: TObject);
  protected
    procedure DoOnSettingChange; override;
  private
    FMenuModeIsMini: Boolean;
    FMenuHided: Boolean;
    FMenuWasCollapsed: Boolean;
    procedure HideMenu;
    procedure SetMenuModeIsMini(const Value: Boolean);
    procedure ShowMenu;
    procedure ShowHideMenu;
    procedure InternalHideMenu;
    property MenuModeIsMini: Boolean read FMenuModeIsMini write SetMenuModeIsMini;
  public
  end;

var
  FormMain: TFormMain;

const
  IconProc =
 'M11.81 2.45a1.5 1.5 0 0 0-2.12 0L7.961 4.175A1.5 1.5 0 0 0 6.497 3h-3a1.5 1.5 0 0 0-1.5 1.5v8c0 .51.255.96.644 1.231c.243.17.54.27.859.27h8a1.5 1.5 0 0 0 1.5-1.5v-3a1.5 1.5 0 0 0-1.125-1.452L13.58 6.34a1.5 ' +
    '1.5 0 0 0 0-2.121zM9.578 8h-1.58V6.42z' +
    'm.818-4.844a.5.5 0 0 1 .707 0l1.771 1.77a.5.5 0 0 1 0 .708l-1.77 1.77a.5.5 0 0 1-.708 0l-1.77-1.77a.5.5 0 0 1 0-.707zM6.997 4.5V8h-4V4.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5z' +
    'M3 12.5V9h3.997v4h-3.5A.497.497 0 0 1 3 12.5M7.997 9H11.5a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5H7.997z';
  IconPerf =
    'M8.97 6.332a.5.5 0 0 0-.938-.008L6.654 10H5.5a.5.5 0 0 0 0 1H7a.5.5 0 0 0 .468-.324l1.02-2.721l2.041 5.713a.5.5 0 0 0 .918.056L12.81 11h1.69a.5.5 0 0 0 0-1h-2a.5.5 0 0 0-.447.276l-.976 1.952zM5 3a2 2 0 ' +
    '0 0-2 2v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2zM4 5a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1z';
  IconJournal =
    'M10 4a6 6 0 1 1-5.982 5.538a.5.5 0 1 0-.998-.076Q3 9.73 3 10a7 7 0 1 0 2-4.899V3.5a.5.5 0 0 0-1 0v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1H5.528A5.98 5.98 0 0 1 10 4m0 2.5a.5.5 0 0 0-1 0v4a.5.5 0 0 0 .5.5h3a.5.5 ' +
    '0 0 0 0-1H10z';
  IconAutorun =
    'M10 2a8 8 0 0 1 5.44 13.866l-.082.062a.5.5 0 0 1-.6-.794l.254-.246A6.97 6.97 0 0 0 16.98 10.5h-1.503A.49.49 0 0 1 15 10c0-.268.208-.5.477-.5h1.503a7 7 0 0 0-6.479-6.48v1.502A.49.49 0 0 1 10 5a.49.49 0 ' +
    '0 1-.499-.476V3.02a6.97 6.97 0 0 0-4.083 1.69l1.063 1.063a.49.49 0 0 1-.016.69a.49.49 0 0 1-.69.017L4.71 5.417A6.97 6.97 0 0 0 3.02 9.5h1.503A.49.49 0 0 1 5 10a.49.49 0 0 1-.477.5H3.02a6.97 6.97 0 0 0 ' +
    '1.968 4.388l.253.246l.067.075a.5.5 0 0 1-.747.657A8 8 0 0 1 10 2m3.196 4.102a.502.502 0 0 1 .74.64v.002l-.001.002l-.005.009l-.02.037l-.078.138a195 195 0 0 1-1.15 2.026a80 80 0 0 1-.947 1.61c-.141.232-.271.44-.38.603a3 ' +
    '3 0 0 1-.295.391a1.5 1.5 0 0 1-2.12-2.12c.123-.124.464-.4.865-.718c.415-.33.93-.73 1.432-1.118a347 347 0 0 1 1.795-1.376l.121-.093l.032-.025l.01-.006z';
  IconDetails =
    'M3 5.5a1 1 0 1 0 0-2a1 1 0 0 0 0 2m3-1a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5m.5 4.5a.5.5 0 0 0 0 1h11a.5.5 0 0 0 0-1zm-2.5.5a1 ' +
    '1 0 1 1-2 0a1 1 0 0 1 2 0m-1-4a1 1 0 1 0 0-2a1 1 0 0 0 0 2';
  IconServices =
    'M11 3c-.69 0-1.25.56-1.25 1.25V5H6.5a.5.5 0 0 0-.5.5v3.25h-.75a1.25 1.25 0 1 0 0 2.5H6v3.25a.5.5 0 0 0 .5.5h3.25v.75a1.25 1.25 0 1 0 2.5 0V15h3.25a.5.5 0 0 0 .5-.5v-2.25h-.75a2.25 2.25 0 0 1 0-4.5H16V5.5a.5.5 ' +
    '0 0 0-.5-.5h-3.25v-.75C12.25 3.56 11.69 3 11 3M8.764 4a2.25 2.25 0 0 1 4.472 0H15.5A1.5 1.5 0 0 1 17 5.5v3.25h-1.75a1.25 1.25 0 1 0 0 2.5H17v3.25a1.5 1.5 0 0 1-1.5 1.5h-2.264a2.25 2.25 0 0 1-4.472 0H6.5A1.5 ' +
    '1.5 0 0 1 5 14.5v-2.264a2.25 2.25 0 0 1 0-4.472V5.5A1.5 1.5 0 0 1 6.5 4z';
  IconSettings =
    'M1.911 7.383a8.5 8.5 0 0 1 1.78-3.08a.5.5 0 0 1 .54-.135l1.918.686a1 1 0 0 0 1.32-.762l.366-2.006a.5.5 0 0 1 .388-.4a8.5 8.5 0 0 1 3.554 0a.5.5 0 0 1 .388.4l.366 2.006a1 1 0 0 0 1.32.762l1.919-.686a.5.5 ' +
    '0 0 1 .54.136a8.5 8.5 0 0 1 1.78 3.079a.5.5 0 0 1-.153.535l-1.555 1.32a1 1 0 0 0 0 1.524l1.555 1.32a.5.5 0 0 1 .152.535a8.5 8.5 0 0 1-1.78 3.08a.5.5 0 0 1-.54.135l-1.918-.686a1 1 0 0 0-1.32.762l-.366 2.007a.5.5 ' +
    '0 0 1-.388.399a8.5 8.5 0 0 1-3.554 0a.5.5 0 0 1-.388-.4l-.366-2.006a1 1 0 0 0-1.32-.762l-1.918.686a.5.5 0 0 1-.54-.136a8.5 8.5 0 0 1-1.78-3.079a.5.5 0 0 1 .152-.535l1.555-1.32a1 1 0 0 0 0-1.524l-1.555-1.32a.5.5 ' +
    '0 0 1-.152-.535m1.06-.006l1.294 1.098a2 2 0 0 1 0 3.05l-1.293 1.098c.292.782.713 1.51 1.244 2.152l1.596-.57q.155-.055.315-.085a2 2 0 0 1 2.326 1.609l.304 1.669a7.6 7.6 0 0 0 2.486 0l.304-1.67a1.998 1.998 ' +
    '0 0 1 2.641-1.524l1.596.571a7.5 7.5 0 0 0 1.245-2.152l-1.294-1.098a1.998 1.998 0 0 1 0-3.05l1.294-1.098a7.5 7.5 0 0 0-1.245-2.152l-1.596.57a2 2 0 0 1-2.64-1.524l-.305-1.669a7.6 7.6 0 0 0-2.486 0l-.304 ' +
    '1.669a2 2 0 0 1-2.64 1.525l-1.597-.571a7.5 7.5 0 0 0-1.244 2.152M7.502 10a2.5 2.5 0 1 1 5 0a2.5 2.5 0 0 1-5 0m1 0a1.5 1.5 0 1 0 3 0a1.5 1.5 0 0 0-3 0';
  IconWinMan =
    'M4.5 2A2.5 2.5 0 0 0 2 4.5v8A2.5 2.5 0 0 0 4.5 15h8a2.5 2.5 0 0 0 2.5-2.5v-8A2.5 2.5 0 0 0 12.5 2zM3 12.5V6h11v6.5a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 3 12.5M3 5v-.5A1.5 1.5 0 0 1 4.5 3h8A1.5 1.5 0 ' +
    '0 1 14 4.5V5zm4.5 13a2.5 2.5 0 0 1-2.45-2h1.035A1.5 1.5 0 0 0 7.5 17H14a3 3 0 0 0 3-3V7.5a1.5 1.5 0 0 0-1-1.415V5.05a2.5 2.5 0 0 1 2 2.45V14a4 4 0 0 1-4 4z';
  IconUsers = 'M4 5.5C4 4.67157 4.67157 4 5.5 4C6.32843 4 7 4.67157 7 5.5C7 6.32843 6.32843 7 5.5 7C4.67157 7 4 6.32843 4 5.5ZM5.5 3C4.11929 3 3 4.11929 3 5.5C3 6.88071 4.11929 8 5.5 8C6.88071 8 8 6.88071 8 5.5C8 4.11929 ' +
    '6.88071 3 5.5 3ZM10.5 6C10.5 5.44772 10.9477 5 11.5 5C12.0523 5 12.5 5.44772 12.5 6C12.5 6.55228 12.0523 7 11.5 7C10.9477 7 10.5 6.55228 10.5 6ZM11.5 4C10.3954 4 9.5 4.89543 9.5 6C9.5 7.10457 10.3954 8 ' +
    '11.5 8C12.6046 8 13.5 7.10457 13.5 6C13.5 4.89543 12.6046 4 11.5 4ZM1.5 10.5C1.5 9.67157 2.17157 9 3 9H8C8.82843 9 9.5 9.67157 9.5 10.5V10.5938L9.5 10.5953L9.49999 10.5971L9.49995 10.6013L9.49976 10.6124C9.49955 ' +
    '10.621 9.49919 10.6319 9.49856 10.645C9.49729 10.6712 9.49491 10.7062 9.49049 10.7488C9.48165 10.8339 9.46453 10.9502 9.43124 11.0875C9.36484 11.3614 9.23232 11.726 8.96687 12.091C8.41787 12.8458 7.37788 ' +
    '13.5 5.5 13.5C3.62212 13.5 2.58213 12.8458 2.03313 12.091C1.76768 11.726 1.63516 11.3614 1.56876 11.0875C1.53547 10.9502 1.51835 10.8339 1.50951 10.7488C1.50509 10.7062 1.50271 10.6712 1.50144 10.645C1.50081 ' +
    '10.6319 1.50045 10.621 1.50024 10.6124L1.50005 10.6013L1.50001 10.5971L1.5 10.5953C1.5 10.5932 1.5 10.5938 1.5 10.5938V10.5ZM2.5 10.5897L2.50027 10.5966C2.50071 10.6056 2.50175 10.6223 2.50416 10.6455C2.50899 ' +
    '10.692 2.51921 10.7637 2.54061 10.8519C2.58359 11.0292 2.66982 11.2662 2.84187 11.5028C3.16787 11.951 3.87788 12.5 5.5 12.5C7.12212 12.5 7.83213 11.951 8.15813 11.5028C8.33018 11.2662 8.41641 11.0292 8.45939 ' +
    '10.8519C8.48079 10.7637 8.49101 10.692 8.49584 10.6455C8.49825 10.6223 8.49929 10.6056 8.49973 10.5966L8.5 10.5897V10.5C8.5 10.2239 8.27614 10 8 10H3C2.72386 10 2.5 10.2239 2.5 10.5V10.5897ZM11.5 12.5C10.9118 ' +
    '12.5 10.4307 12.4106 10.0396 12.2624C10.227 11.9195 10.3368 11.5944 10.4013 11.3303C10.6694 11.4312 11.0254 11.5 11.5 11.5C12.6186 11.5 13.0782 11.1178 13.2806 10.8344C13.3911 10.6797 13.4468 10.5243 13.4745 ' +
    '10.4076C13.4883 10.3497 13.4947 10.3034 13.4977 10.2744C13.4992 10.2601 13.4997 10.2503 13.5 10.2459C13.4977 10.1098 13.3866 10 13.25 10H10.45C10.375 9.63056 10.2185 9.29071 10.0002 9H13.25C13.9404 9 14.5 ' +
    '9.55964 14.5 10.25L14.5 10.2515L14.5 10.2531L14.5 10.2569L14.4998 10.2665C14.4996 10.2738 14.4993 10.2828 14.4988 10.2934C14.4978 10.3147 14.4959 10.3425 14.4925 10.376C14.4857 10.4427 14.4726 10.5331 ' +
    '14.4473 10.6392C14.397 10.8507 14.2964 11.1328 14.0944 11.4156C13.6718 12.0072 12.8814 12.5 11.5 12.5Z';

implementation

uses
  WinUI3.Style, System.Messaging, FMX.Ani;

{$R *.fmx}

procedure TFormMain.ButtonSearchClick(Sender: TObject);
begin
  ButtonSearch.Visible := False;
  EditSearch.Width := LayoutSearchBar.Width - 40;
  EditSearch.Visible := True;
  EditSearch.SetFocus;
end;

procedure TFormMain.ButtonShowMenuClick(Sender: TObject);
begin
  ShowHideMenu;
end;

procedure TFormMain.ChangeMenuItem(Sender: TObject);
begin
  if RadioButtonSettings.IsChecked then
    TabControlMain.ActiveTab := TabItemSettings
  else if RadioButtonProcesses.IsChecked then
    TabControlMain.ActiveTab := TabItemProcesses
  else
    TabControlMain.ActiveTab := TabItemProcesses;
  if MenuModeIsMini then
    HideMenu;
end;

procedure TFormMain.CheckBoxOnTopChange(Sender: TObject);
begin
  StayOnTop := CheckBoxOnTop.IsChecked;
end;

procedure TFormMain.ClearEditButton4Click(Sender: TObject);
begin
  if EditSearch.Text.IsEmpty then
    LayoutHeadResize(nil)
  else
    EditSearch.Text := '';
end;

procedure TFormMain.ComboBoxThemeChange(Sender: TObject);
begin
  // Override theme color
  case ComboBoxTheme.ItemIndex of
    0:
      ThemeKind := TSystemThemeKind.Unspecified;
    1:
      ThemeKind := TSystemThemeKind.Light;
    2:
      ThemeKind := TSystemThemeKind.Dark;
  end;
  DoOnSettingChange;
end;

procedure TFormMain.Button80Click(Sender: TObject);
begin
  ShowHideMenu;
end;

procedure TFormMain.DoOnSettingChange;
begin
  var OverAccentColor := SystemAccentColor;

  // Set stylebook and color for theme
  if IsDark then
  begin
    // Set accent color for stylebook
    ChangeStyleBookColor(StyleBookWinUI3, OverAccentColor);
    StyleBook := StyleBookWinUI3;
  end
  else
  begin
    // Set accent color for stylebook
    ChangeStyleBookColor(StyleBookWinUI3Light, OverAccentColor);
    StyleBook := StyleBookWinUI3Light;
  end;

  inherited;
  TMessageManager.DefaultManager.SendMessage(Self, TStyleChangedMessage.Create(StyleBook, Self), True);
  TMessageManager.DefaultManager.SendMessage(Self, TInternalSettingChangedMessage.Create(StyleBook, Self), True);
end;

procedure TFormMain.EditSearchExit(Sender: TObject);
begin
  LayoutHeadResize(nil);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  SetSystemWindowControls(ButtonWinClose, ButtonWinMax, ButtonWinMin);
  CaptionControls := [LayoutCaption, LayoutHead];
  OffsetControls := [LayoutHead];
  TitleControls := [LabelTitle];
  IconControl := ImageIcon;
  HideTitleBar := True;
  //
  MenuModeIsMini := False;
  TabControlMain.TabPosition := TTabPosition.None;

  RadioButtonProcesses.StylesData['path.Data.Data'] := IconProc;
  RadioButtonPerfomance.StylesData['path.Data.Data'] := IconPerf;
  RadioButtonJournal.StylesData['path.Data.Data'] := IconJournal;
  RadioButtonAutorun.StylesData['path.Data.Data'] := IconAutorun;
  RadioButtonUsers.StylesData['path.Data.Data'] := IconUsers;
  RadioButtonDetails.StylesData['path.Data.Data'] := IconDetails;
  RadioButtonServices.StylesData['path.Data.Data'] := IconServices;
  RadioButtonSettings.StylesData['path.Data.Data'] := IconSettings;

  ExpanderWindowMan.StylesData['details'] := 'Specify the default behavior of the Task Manager window';
  ExpanderWindowMan.StylesData['icon.Data.Data'] := IconWinMan;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  if ClientWidth < 640 then
    MenuModeIsMini := True
  else
    MenuModeIsMini := False;
end;

procedure TFormMain.LayoutHeadResize(Sender: TObject);
begin
  EditSearch.Width := Round(LayoutHead.Width / 3);
  if EditSearch.Width < 190 then
  begin
    if LabelTitle.Visible then
    begin
      LabelTitle.Visible := False;
      LayoutHeadResize(nil);
      Exit;
    end;
    EditSearch.Align := TAlignLayout.Left;
    EditSearch.Visible := False;
    ButtonSearch.Visible := True;
  end
  else
  begin
    if not LabelTitle.Visible then
    begin
      LabelTitle.Visible := True;
      LayoutHeadResize(nil);
      Exit;
    end;
    EditSearch.Align := TAlignLayout.Center;
    EditSearch.Visible := True;
    ButtonSearch.Visible := False;
  end;
end;

procedure TFormMain.LayoutMenuClick(Sender: TObject);
begin
  HideMenu;
end;

procedure TFormMain.SetMenuModeIsMini(const Value: Boolean);
begin
  FMenuModeIsMini := Value;
  if FMenuModeIsMini then
  begin
    LayoutOverMenuButton.Visible := True;
    LayoutOverMenuButton.BringToFront;
    LayoutTitleMenuButton.Visible := True;
    LayoutTitleMenuButton.Position.X := -1;
    //ButtonShowMenu.Visible := False;
    LayoutMenuLayer.Visible := False;
    LayoutMenu.HitTest := True;
    PanelMenu.Margins.Top := 0;
    LayoutMenuOffset.Visible := True;
    PanelMenu.StyleLookup := 'panelstyle_appbackground';
  end
  else
  begin
    LayoutOverMenuButton.Visible := False;
    LayoutTitleMenuButton.Visible := False;
    LayoutTitleMenuButton.Position.X := -1;
    //ButtonShowMenu.Visible := True;
    LayoutMenuLayer.Visible := True;
    LayoutMenu.HitTest := False;
    PanelMenu.Margins.Top := 48;
    LayoutMenuOffset.Visible := False;
    PanelMenu.StyleLookup := 'popupstyle';
  end;
  InternalHideMenu;
end;

procedure TFormMain.ShowHideMenu;
begin
  if FMenuHided then
    ShowMenu
  else
    HideMenu;
end;

procedure TFormMain.HideMenu;
begin
  FMenuHided := True;
  FMenuWasCollapsed := True;
  if FMenuModeIsMini then
  begin
    LayoutMenu.Visible := False;
    PanelMenu.Width := 250;
    PanelClient.Margins.Left := 0;
  end
  else
  begin
    LayoutMenu.Visible := True;
    PanelMenu.Width := 48;
    PanelClient.Margins.Left := 48;
  end;
end;

procedure TFormMain.InternalHideMenu;
begin
  if FMenuModeIsMini then
  begin
    FMenuHided := True;
    LayoutMenu.Visible := False;
    PanelMenu.Width := 250;
    PanelClient.Margins.Left := 0;
  end
  else
  begin
    if FMenuWasCollapsed then
      HideMenu
    else
      ShowMenu;
  end;
end;

procedure TFormMain.ShowMenu;
begin
  FMenuHided := False;
  FMenuWasCollapsed := False;
  if FMenuModeIsMini then
  begin
    LayoutMenu.Visible := True;
    PanelMenu.Width := 250;
    PanelClient.Margins.Left := 0;
  end
  else
  begin
    LayoutMenu.Visible := True;
    PanelMenu.Width := 250;
    PanelClient.Margins.Left := 250;
  end;
end;

end.

