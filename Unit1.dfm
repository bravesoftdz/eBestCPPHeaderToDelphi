object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 's eBest C++ to Delphi Header Converter'
  ClientHeight = 461
  ClientWidth = 684
  Color = clWhite
  Constraints.MinHeight = 200
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 5
    Top = 0
    Width = 674
    Height = 415
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 5
    TabStop = False
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #46027#50880#52404
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 420
    Width = 684
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      684
      41)
    object Button1: TButton
      Left = 232
      Top = 2
      Width = 215
      Height = 31
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 5
      Anchors = []
      Caption = 'CONVERT && COPY to CLIPBOARD'
      TabOrder = 0
      TabStop = False
      OnClick = Button1Click
    end
    object LinkLabel1: TLinkLabel
      AlignWithMargins = True
      Left = 574
      Top = 10
      Width = 100
      Height = 31
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alRight
      Caption = 'shinjguk.blog.me '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 1
      OnLinkClick = LinkLabel1LinkClick
      ExplicitHeight = 19
    end
  end
end
