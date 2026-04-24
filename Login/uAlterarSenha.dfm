object frmAlterarSenha: TfrmAlterarSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Alterar Senha'
  ClientHeight = 234
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 57
    Top = 41
    Width = 110
    Height = 18
    Caption = 'SENHA ATUAL:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 62
    Top = 113
    Width = 105
    Height = 18
    Caption = 'NOVA SENHA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 145
    Width = 159
    Height = 18
    Caption = 'DIGITE NOVAMENTE:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblUsuarioLogado: TLabel
    Left = 0
    Top = 0
    Width = 377
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'XXXXXXXXXXXXXX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtSenhaAtual: TEdit
    Left = 173
    Top = 37
    Width = 177
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtNovaSenha: TEdit
    Left = 173
    Top = 108
    Width = 177
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtSenhaNovamente: TEdit
    Left = 173
    Top = 141
    Width = 177
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnAlterar: TPngBitBtn
    Left = 270
    Top = 193
    Width = 75
    Height = 25
    Caption = 'ALTERAR'
    TabOrder = 3
    OnClick = btnAlterarClick
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      61000000097048597300000B1300000B1301009A9C18000001474944415478DA
      B5924D4B846010C77B148BF4A210F94A274F9EBBD635C24B6D876821E8B4D7BE
      4D6C11DD5A88680F9D0A3AC5D207E8185E44D035108D45C983DA7F2F829BDA82
      3430CC3CF3CCFC861986AC7414B26CA2288A1C4DD3F770B7A17DD7755F4A80AA
      AA669EE7978410B5A6769265D911455177F8B7A0A3A2284600C825409665071F
      C708BE2D566B9AB60EC0235CC7F3BC81A2281700A8F0CD12806081E25FE31886
      B11A86E1186E2C08C229FC211AE9699A9A4110CC5A01BAAEAFC5713C46C117CF
      F36751145DA3B38251FBBEEF7F56965807C058E728DE6359F63049921B8436B0
      8703009E91BBFB2700B107749C01B2397F330CD3B36DFB7B31B70940107B87FD
      00E495E3B8A16559695D6E23005AD4DDC3B28046F91FC0FC90604E701C93B662
      E4EDC0DC226FAB029024691FDBBE826A6D002CD4810EA6D3E95305D0453A037E
      00228FB6115BBA0A080000000049454E44AE426082}
  end
  object btnFechar: TPngBitBtn
    Left = 189
    Top = 193
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'FECHAR'
    TabOrder = 4
    OnClick = btnFecharClick
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      61000000097048597300000B1300000B1301009A9C18000000584944415478DA
      636480022929A9FF0C448267CF9E31C2D88C543700599218405F03A06A3A816A
      2A28318001D910720D801B82D3002263A59352031A28F14203506D23B9068035
      931B8870CD241B800D50DF0062005573230069A461B4756035F1000000004945
      4E44AE426082}
  end
end
