object dmBD: TdmBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 148
  Width = 193
  object BD_SIGE: TIBDatabase
    DatabaseName = 'localhost:C:\BD_SIGE_Stable\BD_SIGE_STABLE.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    DefaultTransaction = trBD_SIGE
    Left = 40
    Top = 32
  end
  object trBD_SIGE: TIBTransaction
    DefaultDatabase = BD_SIGE
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 32
  end
end
