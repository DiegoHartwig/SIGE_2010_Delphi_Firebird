object frmRelatAgendaXEquipamentos: TfrmRelatAgendaXEquipamentos
  Left = 0
  Top = 0
  Align = alCustom
  BorderStyle = bsNone
  Caption = 'Relat'#243'rio de Agendamentos'
  ClientHeight = 675
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 5
    Top = 4
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = frmConsultaAgendamentos.qConsultaAgendamento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoom100
    PreviewDefaultSaveType = stQRP
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 139
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        367.770833333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 190
        Top = 17
        Width = 371
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          502.708333333333300000
          44.979166666666670000
          981.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Relat'#243'rio dos Agendamentos por Equipamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel2: TQRLabel
        Left = 287
        Top = 62
        Width = 386
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          759.354166666666700000
          164.041666666666700000
          1021.291666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Funda'#231#227'o Educacional Machado de Assis - FEMA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 287
        Top = 84
        Width = 153
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          759.354166666666700000
          222.250000000000000000
          404.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Rua Santos Dumont'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel4: TQRLabel
        Left = 439
        Top = 108
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1161.520833333333000000
          285.750000000000000000
          76.729166666666670000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRImage1: TQRImage
        Left = 5
        Top = 2
        Width = 169
        Height = 135
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          357.187500000000000000
          13.229166666666670000
          5.291666666666667000
          447.145833333333300000)
        Picture.Data = {
          0A544A504547496D616765051C0000FFD8FFE000104A46494600010101004800
          480000FFDB004300030202030202030302030303030304070504040404090607
          05070A090B0B0A090A0A0C0D110E0C0C100C0A0A0E140F1011121313130B0E14
          1614121611121312FFDB00430103030304040408050508120C0A0C1212121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121212FFC00011080091009703012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD53
          A28A2800A28A2800A28A2800A28A2800A2909C0A370C7271400B4573FE22F883
          E17F084465F16788F41D1621D5F51D4A2B651F8BB0AE5FFE1A53E11E7FE4A97C
          3AFF00C2A6CFFF008E55AA7396C999BAB4E3BC91E914571BE17F8CBE01F1C6AA
          34CF05F8DBC23AFEA263693EC9A5EB76F752EC5C65B623938191938EE2BB2A99
          45C5D9AB1519C64AF1770A28A2914145145001451450014514500145149400B4
          526E146E1EB400B4D7608A4B1000EA4D2E7348EA1D4AB00411820F7A00FCC2FD
          A0BFE0A85E27D5759BFD1FE01C369A268D6F298E2D7AEADD6E2EEF02B7FAC8E2
          9018E246C1003ABB1520FC8781F20F8D3E377C41F889E6AF8E3C6BE28D6A0965
          321B5BBD5257815BA6561DDB17E8AA2B7BF69AF8333FC0BF8DDE23F08AC537F6
          74373F68D19D831F3AC65F9A1C310379504C6C471BE371DABD4BE147FC13B3E2
          7FC40D2A3D6BC61FD9BF0FB40D9E6C971AF315B9116092E2DC72B8C722568CE3
          9E95F6D4A381C3518CF449F57BFF0099F0759E618AAF2A7AB69ECB63E59E831D
          BD28AFB847ECD1FB337C3D4F2BC71F143C51E36D56D8EE922F0E5BC715B4C0F4
          01B648B9F5C4FF00954D3EA9FB2C68D142FE1CF833E23D5EE62EA757D7E78431
          1DC85B8914E7D36815C75789B2FA6EC9DFD0FA9C0F863C4F8C4A50C3349F7D3F
          3B1F20FC2FF88DABFC24F883A0F8BFC2B204D4F40BC5B8895890B2AF2B244F8E
          763A332363B31AFDE3F869F1074AF8A9E04D0FC59E169BCED335EB34B9872CA5
          A327868DF69203A30646009C32B0ED5F9D50FC7AF83D638161FB36F815828C06
          BA9E29CFE3BAD8FF003AFA07F65CFDAB7C35E27F13DBF80F4AF03E8BE01B2BA8
          E5934B834A655B7927FBEF1F969122AB32866DDDCAE3A915E0E619D60F1B28F2
          5D48FA9C3786BC4B94E1EA57C452FDDA5776945DADD6C9B7B6E7D774522F2296
          B8CF2428A28A0028A28A0028A28A006B671C6735E0BE20F04FED05E3879C2FC4
          6F067C37B613B7D9E1D03C3ADAC4CD09C6D12CF74C8370E7EE44BD6BDF28AB85
          47077497CD5FF333A94D4D59B7F2763E30D67F622F8C3AADD4B74FFB5278E44D
          3316648ED6E608F3EC91DE8551EC062BC83C69FB277ED73E120F73E10F8A7AFF
          008B22493F750D9F8CEF2DE7619FBCC970EB1E3DBCC6FC6BF4BA8AECA799568E
          E935E88E2A995D09ECDA7EACFC819BF6D5FDA5FE07EBF169BF116EAF7CE85495
          D37C51A0A209D41DBB848A91C8EB91F796420FAD7B1FC3EFF82B637EE20F8ABE
          04C90A7ED17DE1FBCC64F6DB6D37F59ABF403C5DE09F0FF8FB459748F1B68DA6
          6BBA64E417B4D42D9678CB0E8DB581018762391DABE15F8FBFF04B1D33515B9D
          5BF67DD4C691738DDFF08FEAB2B496EFC0E21B839743C1E1F7824FDE415DF4B1
          580AFA57A6A2FBAD8F3EB61330C3FBD42A732ECF73CF7FE1A9BC19FB407EDDFF
          000A7C4F3E8571A6F8774B09A5DBB6A9123CF2DDC827FB348EA8595025CCD16D
          F98ED2BBF23A0D9FDB57C77E2AF15FC6FD53C1F34F792693A4CF6D1699A4DB82
          56592486360E517FD648CD21C70480428EF9F893E20FC33F16FC24D79B49F889
          A16A7E1DD46325A31751ED59429C178A41959173FC4848CF7AFD6FF0379579F0
          F7C11F1E3C71A609FC5569E00586F04F1857B9B893CA314E30B88CB666F982E4
          2DC6390315C5C4B84A70C3C2A4256825AF5D16A7D6F865C41F50CD6ACEBD0E7A
          8D3E55B7BEEC97A6D6BF99F34FC3DFD84BE22F8C6282EFC422C3C276136D3FF1
          3072F72508077085338FF75D90FA815ED1E17FF8274F84A4B6DDAFF8D35AD55C
          3152FA5450DB2641E410C25E9F5AF3BF1C7C5DF157C409E53AFEA938B493A585
          B318ADD47A6C07E6C7AB64FBD7ACFEC83F103FB3F5ABEF09DF48045A90375620
          9E932AFEF107FBC801F41E59F5AFCB72FE26C06271F1C3469BE5968A4DF5E9A7
          99FBA7113E2CA596D4C6BC4A8B8EAE14E3B2EBEF3BB6D75F46751A57EC13F09E
          C2254BDB1D675465EAF75AA4885BEBE56C1F956FE95FB1AFC24D1351B3D4349F
          0CCF6D7D613A5C5B4E9AD5F6E8A4460CAC0F9DD4100FE15ED63914B5F76B0F49
          6D15F71F8DD5E26CE6AA6A78BA8D3FEFCADF75C40314B4515B1E185145140051
          4514005145140051484E3AD57FED1B4FF9F9B7FF00BF829A4DEC26D2DCB34557
          FED1B5FF009F9B7FFBF829D15DC3336D8658A42064857078A1C5AE82E68F726A
          28A2914453DAC37400B98A39429C80EA1B07F1AA9AF68B6BE21D0EFF004BD494
          B5A6A16D25BCCAA70763A95383D8E0D68521E94A51528B8BD9950938494A2ECD
          1F9AFE29F0E5DF843C47A8E8BAAA9175A6DC342E76901C0FBAE3D9970C3D88A7
          784AE356B2F1269F75E1482E6E755B29D67B68ADA1695D990E71B17923B11DC1
          22BEB0F8CBF02A0F1E7C47F0D6A4A5EDECEFD8DAEAEF0801B11C6D246C38EAC1
          4C658F4F93F1F5CF0B783345F0569AB63E18D3AD74FB75C64449F3390319763F
          331F7249AFCAB0FC0F889636A7BFC94E32F75EEDF556F4EFDCFDBB15E25E1639
          6525ECBDA559C7DE5B457477DF7DD2ECF72F68BA83EABA4595E4D6D3D9C9756F
          1CAD6F3AED9212CA09461D986707DC55DA4031D296BF558A6924DDCFC424D36D
          A560A28A298828A28A0028A28A0028A28A00E3BE3312BF083C705490CBE1BD40
          823B1FB3495F81FE18F0C5EF8CBC4DA4681A040971AA6B97D0585944CE103CD3
          4823452C48001661C9E057EF7FC66FF923FE39FF00B16F50FF00D2692BF0E7E0
          2EB165E1FF008E7F0EF55D72E61B2D3B4DF15E99757973336D48228EEA367763
          D805049FA57D1E46DAA555A5AAFF00827CBE7E93AD462DE8FF00CD1EBE3FE09B
          BF1D874F0A69DF5FEDCB4FFE395F527FC13FFF00636F1AFC10F895AE78B3E2BE
          9D65A738D20D8699047750DD17696456924CA13B0AAC417A8C895BD2BE941FB5
          F7C16FFA297E12FF00C0F5AEF6FF00E2278774FF0000CFE359756B47F0BC1A69
          D4CEA713799135A84DFE6295C96057900649E8066B8F1398E3274DD39C6C9F93
          3BB0D96E0A9D455212BB5AEF73A4A4AFC9BF1EFEDB7F1B7F691F8812F87BE004
          5ACE87A65C16163A5E8D0AB5EC91A91FBE9EE00CC67B9D8CA8A18292D8DC7998
          FF0069EFDA3FF661F1D45A77C48D535F9E64DB3CFA478A7FD323BC84E4029312
          5B6E4101A27C6E520E704511C9AB356724A5DAFA8E59DD04EEA2DC7BDB43F62E
          8AE1BE0B7C5AD2BE377C30D0FC69E1B478AD75880B3DBC872F6D323149626381
          92AEACB9C00C0023822BE33D53FE0AD9A541A35D2D87C3BBFF00EDE495E38A19
          757436A00242B99047B8F625760F4DDDEB868E0EBD5938C2376B73BAAE3B0F4A
          0A739593DBCCFD042A0F5A5AFC61F88DFB527ED25E2DD363F16EB1AA78D3C37E
          18BC9BFD0AEF48D3A6D334E1BBEEC71CEAA3CCE8701E476E0F2715DCFC34FF00
          82997C46F0BFC3BD4F41D7ED62F17F8AA59A18F40D56F2300C28C08759963C19
          981081070C4BB166380A7BE592E2146F169FCCE08E7B87E7E5926BD56E7EB266
          96BF137C73FB48FED1FE1CF10DADEF8FFC51F10BC35A84E04F6D6D7B6B269714
          C80FDE5B62891BA678CEC20E315FA61FB0FF00C7CD4FF685F8216FAD78B0467C
          41A35FC9A56A93C712C6B772C691C8B3045E177472A6E0001BC3E0018030C565
          9570F4D546D35E46D84CD69622ABA4934FCCFA0A9335F999FB57FED29FB42587
          ED07E25F879F0D6E75182D74EF2DAC2C7C35A27DA2E2E6DE48924494B98DE52C
          03ED62842865231C5785EBDF173F6A0F8432DAEAFE31D73E29E8514F2ECB79B5
          D8EE0DB492104ECDB3A98CB6158ED209C02718AD6965152A453E78A6F65733AB
          9CD3A7292E4934B46EC7ED4515F30FEC23FB535FFED25E04D56DFC650C09E2BF
          09CB0C5A84F6E8123BD8A50DE54E17A23931C8ACA3E5CA82301B6AFD3D5E756A
          33A351C27BA3D2A15E15A9AA90D9851451591B051451401C6FC66FF923FE39FF
          00B16F50FF00D2692BF077E1FF008466F881E3CF0DF85ECE78AD2E3C49ABDAE9
          B14F2A96585A795630E40E4805B3F857EF17C67FF923FE39FF00B16F50FF00D2
          692BF117F66DFF00938AF85BFF0063A691FF00A59157D1649271A35A4B75FE4C
          F98CFA2A55E8C5ECFF00CD1F577FC3A4BC5D8E3C79E1D3FF006E137F8D7A77ED
          D1A6EA7F05BF614F06F81A3BC86F3FD374AD0B51B948CA2CE904124DB9413900
          CB6B19E7B57DDE3A57C83FF0547F0C5F6BFF00B33C57BA7AAB43E1CF1259DFDE
          E7A889A39AD863FEDA5CC7F866B92863EB62311495677499DB88CBE8E1B0B565
          4559B5DCF863F639FDA9F47FD97751F136A1AA784E5F11DFEBD15B416D3C778B
          6ED6B1465DA4504A3121D9A32471FEA96AC7ED93FB5A69FF00B539F09BE9FE18
          B9F0F4BE19FB607696F56E3CF59FC9C0E1171B4C27D7EF5757FF0004E7B3F857
          E26F18F893C2BF1A748F0FEA5A86AD15B4BE1F6D5E14656743209A1466FE360F
          1B051C908DE95F7E789FF674FD9EBC15A4CBAA78C3C19F0FB44D360FF5977A84
          10DBC49D8659C81C9AF4F1589C3D0C6734A9B73EFF0023CAC26171388C172C6A
          250EDF33C0FF00E092BE246BBF867E39D05BEEE99AE437AB9EDF688027FEDB7E
          B5F007C18D3ED758FDA03C0B63AB5B417B657DE31D3A1B9B6B88C491CD1BDE46
          AC8EA7865209041E0835FB61F063C23F0DF43F0BAEB1F03B49F0FD8E8BE2344B
          8FB568F6EB1A5E05042962064EDCB0C1FBA4B0C039AFC57F811FF271FF000EFF
          00EC77D33FF4B63A597D6556AE22A256BDBF51E6341D1A386A6DDECDFE87EB07
          FC140A043FB2078FC151858EC4818E845FDB915F0A7FC12EB4EB4BFF00DA6669
          2FADADEE1ECBC337935B34B1873049E6C09BD09FBADB1DD7239C330E84D7DDDF
          F0501FF9341F883FF5C6CBFF004BEDEBE1AFF8256FFC9C9DFF00FD8A979FFA3E
          DAB9B017FECDADF3FC91D58F5FF0A947E5F9B3D67FE0AF30A7D83E164B81BD25
          D5941F622D09FE42BACFF824BB7FC59AF190E71FF093E40FFB7587FC2B96FF00
          82BC9FF895FC2EFF00AEFAA7FE836B5ADFF04BCD4A6D1FF679F88D7F67179D71
          63ACCD3C51633E63259C6C17F123145AF9425E7FA85ED9CBF4FD0F76F8E9FB6E
          FC2DF805AD49A3F892EEFF0058F10C414DCE97A25B2CF35BA9195F35DD923438
          20ED2FBB0C0EDC106BE2DFDAABFE0A05A07C7FF851A9F82F47F06EA7A735E5CD
          BCD05FDEDE46C62314AAFF007154F25415E1BF8BBD7CF7FB3BF86B49F8CFFB47
          F85F4BF8B3A94F2D8789F58924D56E66B92925F4CCAF208DA4CE774D3058C904
          3132F04360D7DF9FB7C7C21F865F0CFF0065BD5DFC27E11F06F8775592F2C6DE
          C2E2DB4DB782EA5613A1754936891DBCB5727924AAB13C66B48E170D84AF4A9C
          9394DDB5E8652C5E2B1987AB522D460AFA5B53CCFF00E091049F10FC4CF4FB16
          9DFF00A1DC57E9557E6A7FC121FF00E461F899FF005E7A77FE873D7E95D79D9C
          7FBE4FE5F923D3C93FDCA1F3FCD8514515E61EB05145140185E3CD026F15F81F
          C43A259C91C33EB1A55CD9C52499DA8D2C4C809C73805ABF39BE107FC1337E28
          F80FE2C7833C4DAE6B7E05934FF0EEBF65A8DD25ADFDD3CAF1C13A48CA8AD6CA
          0B10B8196039EB5FA59A9EA36FA3E9D757DA83F976B670BCD3BED2DB1154B31C
          0049C0078033585E04F88DA37C47D2CEA5E175D67EC44218E5D4B43BCD37CE57
          50CAD18B98A33229041DCA08F7AEBC3E2EB5184A30D9EE71E230742BD48CA7BC
          763A61D2B37C4DE1BD37C63E1ED4B43F125A477DA56AF6B25ADEDB499DB2C4EA
          5594E391904F2391D4568F983B62B3B52F1258693A9E95A7DFCC63BBD6A7782C
          902337992244F2B0C8185C246E7271D31D48AE557BE8753E5B599F97DF18FF00
          E0969E3BF0EEA97571F072F6C3C57A2BB66DACEF2E92D2FA3049F958BED85F03
          1F3EF5CF3F20AE2BC2FF00F04D5F8E9E23BC316B5A468DE1D8D07CB71AAEB50C
          AA47A016E656FCC0AFD870E0E7DBDEB2EFBC4D65A76AD6BA6DC2DE9BABC52D09
          8AC66923E081869150A29E7386607019B185623D686758B51B68DF7B6A78F3C9
          306E57D52ED7D0F37FD977E075EFECF3F082C7C1BA9F8824F11CB6B7335C09BE
          CE218ADFCD6DED0C4B9276072CD962496763F282147C51F0DBFE099DF147C19F
          173C2DE27D4B5BF02CBA6E87E23B3D4A7482FEE8CCF0C37092305536C1779553
          80580CF71D6BF4CC38271915C96B1F15340D13C6707856EBFB6AE35B9E1B79FC
          9B0D02F6F628229E592289E69A185A28559E1946E9194008C4E00CD7351C7622
          129CA3BCB7D0EBAD81C3CE308CF68EDA9CCFED41F0B356F8D7F023C53E0BF0BC
          F616BAA6B71DBADBCB7F23A42A63B98A53BCA2B30C88C8E14F2457CDDFB157EC
          3DE3DFD9D3E2F5D78A7C73A9F84EF34F9B43B8B158F4ABCB8965F31E58581224
          8106DC46DCE739C71E9F67DFF8AB4ED335CD2F48BD98C7A86B4B3B5945E5B112
          8854349F30185C060792339E335ABBC5674F17569D19525F0C8BA983A352B46A
          CBE289F2B7EDDBFB2B78B3F69CB0F06C5E00BFF0FD94BE1D9AF1AE7FB5EE2588
          38984217618E27CE3CA39CE3A8AD8FD87BF66DF12FECDBF0FBC41A178FEF343B
          EBBD5B58379136953CB2C623F2634C31923439CA9E304631CD7D23E60F51F9D5
          3D5B578346D3A7BDBA4BA961B75DCEB6B6B25CCA4671F2C71AB3B1E7A00697D6
          EABA1EC3EC87D4E8FB7FAC7DA3F303F680FF00826578E348F18DFEA7F01A0B2D
          73C3B7B7266B3D2DAF92D6EB4E0CC5BCADD332A3C69C056DFB88C64123718745
          FF008274FC77F8AF3D95DFC63F1441A6C76C9E4A0D6B5A9757BBB78C7458D54B
          C7B7D84A2BF54778A378AEC59C625412D2EBADB5391E4B84726F5B3E97D0F947
          F630FD90F5FF00D973C61E377D6758D375CD275DB4B24B0BBB7468652D1B4A5C
          4911C85C6F18C3367F41F585654DE26D3ADFC4D63E1F9A72BAAEA561737F6D0F
          96C43C16EF047336EC6D186BA80609C9DDC03838D5AE0AF5A75A7CF3DD9E861E
          853A34FD9D3D9051451589B85145140191E2DD2A6D77C2FAC69B66D1ACFA8584
          F6F119090A19E365049009C64FA1AF28B5F81BA9784FE1AF83B4EF08CDFDA1AF
          7862FB4FBF961D6FC477D3DB5C4D0C3E4CA91CD2899E08F0ECCAA91EDCA81B57
          248F50F1EC92C5E06F10BDAB4893A695726268C90C1844D8208E739E95F1C69B
          A8F8E2EF4AF057852FAEBC4AB07C3AF14F87F51BAD49A79C3EAD6FA8EA763F62
          89A463BA68A3B6B9D461954961BAD23663CE2BA6846528BB3B6A72622718BD55
          F4FEBFAF23D323FD973569F40D220D4CF866EB56D0FC336F616378DE6136D7D0
          DFFDA167898C65930BD187CC0923A649DDB6F81DE21B1F8B137896D6DBC24586
          B97DA926BF3CB2BEA37114F60F0456D3442200C70BB22A8F3B98E3180A720D59
          BE38F8AA4F1AF8C2C3C33A7C7AC8D1741D7EE6D74792D7CABB37F612DBA5A425
          51D9952E0492B21701A55559102AE737352F10EA5E3183E1DCDE11F1B697ACCD
          278BE68E7D5B4FD3FF007108FEC4BE768DE2129076B95E19BE5250302CA49BBD
          5EAD6B7334A8FD94F43CF6D7F67FF15F813E17789CEBBA7786F534FB468BAAC9
          E1AD293CCB5D5A4B17DD710B436D610A8F382C5B42C0FCA22BE55727A5F147C1
          6F1478FF00C43F0FBC45A3687E0FF0DE9DA559F8727360C2382EF4736B7C2EAE
          6DA37FB0195E3F242C288B2DBAA9F337290F8129F8FF00E24B89BE1E32C56769
          77AFE95E1ABDD574D9ACCAAC8352B9105C7904C864630EE04FCA163CA6E67F33
          6AE4DC7C50F17CDE3CD6753B46B7D4B5BF0DF847C6A6D3C316F63287827B6BFB
          25B049915CB4AD3C31248980A5848EC9957502FF007AF576FEBFE188BD24ACAF
          6FEBFCF63B8F007C14D63C2DF15E7F10DFDB786E3805DEB97126B5693C8DA96A
          E97F76B3C16F728620163B740235FDEC9910C5B420CA8B5E2CF85BE20D43E3BD
          B78C74EB4B3BCD21F4CD2ACE43FF00098EA3A44B6CD6B7777348ED6D6F134578
          A56E5311CCE1728CA701C9ADCF837E38D47C66FE25175A869FAFE95A66A3141A
          5EBB636FE5457E8D6D1492818665631CAF246594E06361F9D1C9F269BE2AF8C2
          7D7354D6ED4DB6A1AEE89E0FF14489E1AB6D3A5274DBB86F6CC430CC165CCEDE
          52A3055D8CF97643B268C2E4BDA39BD7C8D9BA718A76F3377FE19EF5A9FE23DF
          6AB736FE184B5BB7D6C4DE2049E46D52F62D4232218E68FC90B8B6056141E730
          31C6A404E56B3F4FF807E339BC3B711F89ACBC157F7066D09DB4393529E6B0D4
          63B080C2F1CF235B02013B274FDD380E8AA4606E3EA3F053C5FAA78DBC3BA85F
          6B373A55F411EA2D0E9D7BA7DC4330B9B711444B48617788482569508462308A
          4804903CABE1478D3C5777F1924F12EB961E2383C21F13C5C41A3B5ECD1C96B0
          7D950BE9ED044B2192013DA47773CA6445CC8D1AF6196A5535D569FF000E4B8D
          35CBA3D4BDE38F811E28F12F8E3C17AB687A4F81746D3FC3F0F87C7936D2C692
          E99F63D40CF750412FF67996484C188A25596DD4664DC98722A7BDF809AD4FA0
          7C40D262D17C1297FE279F519ADBC55F6A905FDD2DCDF9B98E0B95FB3655238C
          AC4089A4E208F0AA0E130EDFE3EF8A5FE13CDACCFAA7864EA9A4EBC965ABDE47
          716EB677886CFCD64D2A7793CA91FCD2A156768D800F1BE1C2B9DFF15FC4CD77
          4AB3F126AFA2BE95A31483449DE5D7E43A7BB45347234D1A09E4F262B90000AA
          FB5777CAE7B8AB54DAEB4FF804DE93BBB32F69DF03F59B6F8C72F8965B6F0DAD
          B0D76EF546D7639A43AA5FDBCDA7B5AA69D3218801023BAB8226618B687F7618
          965E534CFD97F5DF0BFC39BBD03C336DE088E7BFF0CF85AC2FADA4B746B6BDBE
          B0B899F50B87125ACA9BE58DE30933C3236E8D4B28DAA6BE82F026B72F897C15
          A0EAF7515D4136ABA65BDD4915D5AFD96646922562AF16E6F2D812414DCDB4E4
          64E335BB58BAF35A7F5A1D0B0F4DABFF005A9E1FF063E0A7883C0177E0C9B5E9
          F4831F8734AF13D94B0D9DC348231A8EAD6B776B1C5FB98D4A4705B98DB09185
          214226DE9EE1451594E6E4EECD61050564145145496145145002119EB49B47A5
          3A8A006EC1DE8D8B8E9D69D45003762FA0A0201D853A8A0040A074146D1E8296
          8A0040A0741485011D053A8A02C33CB1E83F2A5D83D053A8A02C20007418A5A2
          8A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A2
          8A0028A28A0028A28A0028A28A0028A28A00FFD9}
      end
      object QRLabel11: TQRLabel
        Left = 190
        Top = 62
        Width = 86
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          502.708333333333300000
          164.041666666666700000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Institui'#231#227'o:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel12: TQRLabel
        Left = 190
        Top = 84
        Width = 81
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          502.708333333333300000
          222.250000000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Endere'#231'o:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel13: TQRLabel
        Left = 657
        Top = 84
        Width = 17
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1738.312500000000000000
          222.250000000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'n'#186
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel14: TQRLabel
        Left = 681
        Top = 84
        Width = 28
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1801.812500000000000000
          222.250000000000000000
          74.083333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '820'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel15: TQRLabel
        Left = 190
        Top = 107
        Width = 61
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          502.708333333333300000
          283.104166666666700000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cidade:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel16: TQRLabel
        Left = 287
        Top = 108
        Width = 88
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          759.354166666666700000
          285.750000000000000000
          232.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Santa Rosa '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel17: TQRLabel
        Left = 403
        Top = 108
        Width = 29
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1066.270833333333000000
          285.750000000000000000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 177
      Width = 718
      Height = 55
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        145.520833333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRLabel5: TQRLabel
        Left = 4
        Top = 31
        Width = 36
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          10.583333333333330000
          82.020833333333330000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel6: TQRLabel
        Left = 112
        Top = 31
        Width = 38
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          296.333333333333300000
          82.020833333333330000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Hora'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel8: TQRLabel
        Left = 652
        Top = 31
        Width = 61
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1725.083333333333000000
          82.020833333333330000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Usu'#225'rio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel9: TQRLabel
        Left = 263
        Top = 31
        Width = 74
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          695.854166666666700000
          82.020833333333330000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Utilizador'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRDBText1: TQRDBText
        Left = 330
        Top = 6
        Width = 58
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          873.125000000000000000
          15.875000000000000000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmConsultaAgendamentos.qConsultaAgendamento
        DataField = 'NOME1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 232
      Width = 718
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        82.020833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 4
        Top = 7
        Width = 76
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          10.583333333333330000
          18.520833333333330000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmConsultaAgendamentos.qConsultaAgendamento
        DataField = 'DATA_AG'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRDBText3: TQRDBText
        Left = 112
        Top = 7
        Width = 76
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          296.333333333333300000
          18.520833333333330000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmConsultaAgendamentos.qConsultaAgendamento
        DataField = 'DATA_AG'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRDBText5: TQRDBText
        Left = 263
        Top = 7
        Width = 48
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          695.854166666666700000
          18.520833333333330000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmConsultaAgendamentos.qConsultaAgendamento
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRDBText4: TQRDBText
        Left = 652
        Top = 8
        Width = 57
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1725.083333333333000000
          21.166666666666670000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = frmConsultaAgendamentos.qConsultaAgendamento
        DataField = 'NOME2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 263
      Width = 718
      Height = 76
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        201.083333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRSysData5: TQRSysData
        Left = 4
        Top = 45
        Width = 221
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          10.583333333333330000
          119.062500000000000000
          584.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = 'Data de Emiss'#227'o:'
        Transparent = False
        ExportAs = exptText
        FontSize = 12
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 34
        Width = 718
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          89.958333333333330000
          1899.708333333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRSysData6: TQRSysData
      Left = 629
      Top = 55
      Width = 118
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        1664.229166666667000000
        145.520833333333300000
        312.208333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsPageNumber
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Text = 'P'#225'gina:'
      Transparent = False
      ExportAs = exptText
      FontSize = 12
    end
  end
end
