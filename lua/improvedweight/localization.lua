--local prefix = "#tool."..debug.getinfo( 1, "S" ).source:match(".+[/?\\?](.+)%.lua").."."

local prefix = "#tool.weight_improved."

localify.Bind( "en",    prefix.."language_en",    "English" )
localify.Bind( "pt-br", prefix.."language_pt-br", "Português do Brasil" )
localify.Bind( "sv-se", prefix.."language_sv-se", "Svenska" )
localify.Bind( "ja",    prefix.."language_ja",    "日本語" )
localify.Bind( "nl",    prefix.."language_nl",    "Nederlandse" )
localify.Bind( "pl",    prefix.."language_pl",    "Polskie" )
localify.Bind( "de",    prefix.."language_de",    "Deutsche" )

--[[--------------------------------------------------------------------------
-- English Localization
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "en", prefix.."name",                     "Weight - Improved" )
localify.Bind( "en", prefix.."desc",                     "Modifies the weight of an entity" )
localify.Bind( "en", prefix.."0",                        "Primary: Apply Weight  |  Secondary: Copy Weight |  Reload: Reset Weight" )
-- Errors
localify.Bind( "en", prefix.."error_zero_weight",        "You must apply a weight greater than 0" )
localify.Bind( "en", prefix.."error_invalid_phys",       "This entity does not have a valid physics object (cannot modify weight)" )
localify.Bind( "en", prefix.."error_max_weight",         "Weight cannot exceed max" )
-- Labels
localify.Bind( "en", prefix.."label_colorscale",         "Color Scale: " )
localify.Bind( "en", prefix.."label_weight",             "Weight: " )
localify.Bind( "en", prefix.."label_decimals",           "Decimal Places: " )
localify.Bind( "en", prefix.."label_tooltip_scale",      "Tooltip Scale: " )
localify.Bind( "en", prefix.."label_language",           "Language: " )
localify.Bind( "en", prefix.."label_credits",            "" )
-- Checkboxes
localify.Bind( "en", prefix.."checkbox_round",           "Display rounded weights in tooltip" )
localify.Bind( "en", prefix.."checkbox_tooltip_show",    "Always show tooltip" )
localify.Bind( "en", prefix.."checkbox_tooltip_legacy",  "Use legacy tooltip" )
localify.Bind( "en", prefix.."checkbox_notifs",          "Display notifications" )
localify.Bind( "en", prefix.."checkbox_notifs_sound",    "Play notification sounds" )
-- Comboboxes
localify.Bind( "en", prefix.."combobox_green_to_red",    "Green to Red" )
localify.Bind( "en", prefix.."combobox_green_to_yellow", "Green to Yellow" )
localify.Bind( "en", prefix.."combobox_green_to_blue",   "Green to Blue" )
localify.Bind( "en", prefix.."combobox_blue_to_red",     "Blue to Red" )
localify.Bind( "en", prefix.."combobox_none",            "None" )

localify.Bind( "en", prefix.."combobox_minimum",         "Minimum" )
localify.Bind( "en", prefix.."combobox_maximum",         "Maximum" )
localify.Bind( "en", prefix.."combobox_default",         "Default" )
-- Descriptions
localify.Bind( "en", prefix.."help_colorscale",          "Adds a halo around the target entity with a color representing its current weight. The colors go from minimum to maximum respectively." )
localify.Bind( "en", prefix.."help_decimals",            "Determines how many decimal places the weights should be rounded to when displaying them in the HUD. Zero means whole numbers are displayed." )
localify.Bind( "en", prefix.."help_tooltip_show",        "Shows the tooltip even when the weight tool is not being used." )
localify.Bind( "en", prefix.."help_tooltip_scale",       "Sets the size of the tooltip when drawing the HUD." )
localify.Bind( "en", prefix.."help_tooltip_legacy",      "Enables a slightly modified tooltip used in older versions of Garry's Mod." )
localify.Bind( "en", prefix.."help_notifs",              "Enables helpful notifications when applying, copying, or resetting an entity's weight." )
localify.Bind( "en", prefix.."help_notifs_sound",        "Enables the notification sound when applying weight to an entity." )
-- HUD Text
localify.Bind( "en", prefix.."hud_original",             "Original" )
localify.Bind( "en", prefix.."hud_modified",             "Modified" )
-- Notifications
localify.Bind( "en", prefix.."notif_applied",            "Applied weight" )
localify.Bind( "en", prefix.."notif_copied",             "Copied weight" )
localify.Bind( "en", prefix.."notif_restored",           "Restored original weight" )

--[[--------------------------------------------------------------------------
-- Brazilian Portuguese Localization
-- Big thanks to Sommer (STEAM_0:0:57791547) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "pt-br", prefix.."name",                     "Peso - Melhorado" )
localify.Bind( "pt-br", prefix.."desc",                     "Modifica a massa de uma entidade. Botão esquerdo para aplicar, botão direito para copiar e R para restaurar o peso original." )
localify.Bind( "pt-br", prefix.."0",                        "Botão esquerdo: Aplicar massa  |  Botão direito: Copiar massa  |  R: Restaurar massa" )
-- Errors
localify.Bind( "pt-br", prefix.."error_zero_weight",        "Você deve aplicar um peso maior que 0" )
localify.Bind( "pt-br", prefix.."error_invalid_phys",       "Esta entidade não possui um objeto físico válido. (Não é possível modificar a massa)" )
localify.Bind( "pt-br", prefix.."error_max_weight",         "O peso não pode exceder o máximo" )
-- Labels
localify.Bind( "pt-br", prefix.."label_colorscale",         "Escala de Cores: " )
localify.Bind( "pt-br", prefix.."label_weight",             "Peso: " )
localify.Bind( "pt-br", prefix.."label_decimals",           "Casas Decimais: " )
localify.Bind( "pt-br", prefix.."label_tooltip_scale",      "Tamanho da Tooltip: " )
localify.Bind( "pt-br", prefix.."label_language",           "Idioma: " )
localify.Bind( "pt-br", prefix.."label_credits",            "Tradução Português do Brasil por Sommer (STEAM_0:0:57791547)" )
-- Checkboxes
localify.Bind( "pt-br", prefix.."checkbox_round",           "Mostrar massa arredondada na tooltip" )
localify.Bind( "pt-br", prefix.."checkbox_tooltip_show",    "Sempre mostrar a tooltip" )
localify.Bind( "pt-br", prefix.."checkbox_tooltip_legacy",  "Usar tooltip padrão" )
localify.Bind( "pt-br", prefix.."checkbox_notifs",          "Mostrar notificações" )
localify.Bind( "pt-br", prefix.."checkbox_notifs_sound",    "Tocar sons de notificações" )
-- Comboboxes
localify.Bind( "pt-br", prefix.."combobox_green_to_red",    "Verde para Vermelho" )
localify.Bind( "pt-br", prefix.."combobox_green_to_yellow", "Verde para Amarelo" )
localify.Bind( "pt-br", prefix.."combobox_green_to_blue",   "Verde para Azul" )
localify.Bind( "pt-br", prefix.."combobox_blue_to_red",     "Azul para Vermelho" )
localify.Bind( "pt-br", prefix.."combobox_none",            "Nenhum" )

localify.Bind( "pt-br", prefix.."combobox_minimum",         "Mínimo" )
localify.Bind( "pt-br", prefix.."combobox_maximum",         "Máximo" )
localify.Bind( "pt-br", prefix.."combobox_default",         "Padrão" )
-- Descriptions
localify.Bind( "pt-br", prefix.."help_colorscale",          "Adiciona uma áurea em volta do alvo com uma cor representando sua massa atual. As cores vão de mínima para máxima, respectivamente." )
localify.Bind( "pt-br", prefix.."help_decimals",            "Determina quantas casas decimais a massa deve ser arredondada quando mostradas no HUD. Zero significa que números inteiros serão mostrados." )
localify.Bind( "pt-br", prefix.."help_tooltip_scale",       "Define o tamanho da tooltip ao desenhar o HUD." )
localify.Bind( "pt-br", prefix.."help_tooltip_show",        "Mostra a tooltip mesmo quando a ferramenta peso não está sendo usada." )
localify.Bind( "pt-br", prefix.."help_tooltip_legacy",      "Aciona uma tooltip levemente modificada usada em versões antigas de Garry's Mod." )
localify.Bind( "pt-br", prefix.."help_notifs",              "Aciona notificações úteis ao aplicar, copiar ou restaurar o peso de uma entidade." )
localify.Bind( "pt-br", prefix.."help_notifs_sound",        "Aciona o som da notificação ao aplicar o peso à uma entidade." )
-- HUD Text
localify.Bind( "pt-br", prefix.."hud_original",             "Original" )
localify.Bind( "pt-br", prefix.."hud_modified",             "Modificado" )
-- Notifications
localify.Bind( "pt-br", prefix.."notif_applied",            "Peso aplicado" )
localify.Bind( "pt-br", prefix.."notif_copied",             "Peso copiado" )
localify.Bind( "pt-br", prefix.."notif_restored",           "Peso original restaurado" )

--[[--------------------------------------------------------------------------
-- Swedish Localization
-- Big thanks to Christian (STEAM_0:0:36373825) and Jeff (STEAM_0:0:25982100) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "sv-se", prefix.."name",                     "Viktverktyg - Förbättrad" )
localify.Bind( "sv-se", prefix.."desc",                     "Modifierar vikten av en enhet" )
localify.Bind( "sv-se", prefix.."0",                        "Primär: Applicera vikt  |  Sekundär: Kopiera vikt |  Omladda: Återställ vikt" )
-- Errors
localify.Bind( "sv-se", prefix.."error_zero_weight",        "Du måste applicera en vikt större än 0" )
localify.Bind( "sv-se", prefix.."error_invalid_phys",       "Den här enheten har ej ett giltigt fysik objekt (Kan ej ändra vikt)" )
localify.Bind( "sv-se", prefix.."error_max_weight",         "Vikten kan ej gå över max" )
-- Labels
localify.Bind( "sv-se", prefix.."label_colorscale",         "Färg Skala: " )
localify.Bind( "sv-se", prefix.."label_weight",             "Vikt: " )
localify.Bind( "sv-se", prefix.."label_decimals",           "Värdesiffror: " )
localify.Bind( "sv-se", prefix.."label_tooltip_scale",      "Verktygstips Skala: " )
localify.Bind( "sv-se", prefix.."label_language",           "Språk: " )
localify.Bind( "sv-se", prefix.."label_credits",            "Svensk översättning av Christian (STEAM_0:0:36373825) och Jeff (STEAM_0:0:25982100)" )
-- Checkboxes
localify.Bind( "sv-se", prefix.."checkbox_round",           "Visa avrundade vikter inom verktygstips" )
localify.Bind( "sv-se", prefix.."checkbox_tooltip_show",    "Visa alltid verktygstips" )
localify.Bind( "sv-se", prefix.."checkbox_tooltip_legacy",  "Använd gamla verktygstips" )
localify.Bind( "sv-se", prefix.."checkbox_notifs",          "Visa notifikationer" )
localify.Bind( "sv-se", prefix.."checkbox_notifs_sound",    "Spela notifikationsljud" )
-- Comboboxes
localify.Bind( "sv-se", prefix.."combobox_green_to_red",    "Grön till Röd" )
localify.Bind( "sv-se", prefix.."combobox_green_to_yellow", "Grön till Gul" )
localify.Bind( "sv-se", prefix.."combobox_green_to_blue",   "Grön till Blå" )
localify.Bind( "sv-se", prefix.."combobox_blue_to_red",     "Blå till Röd" )
localify.Bind( "sv-se", prefix.."combobox_none",            "Inget" )

localify.Bind( "sv-se", prefix.."combobox_minimum",         "Minimum" )
localify.Bind( "sv-se", prefix.."combobox_maximum",         "Maximal" )
localify.Bind( "sv-se", prefix.."combobox_default",         "Standard" )
-- Descriptions
localify.Bind( "sv-se", prefix.."help_colorscale",          "Adderar en färgkontur runt målenheten som indikerar dess nuvarande vikt. Färgen går från minimum till maximalt respektive." )
localify.Bind( "sv-se", prefix.."help_decimals",            "Bestämmer antalet värdesiffor som vikten avrundas till när framförda inom HUD. Noll innebär att värderna är avrundade till heltal." )
localify.Bind( "sv-se", prefix.."help_tooltip_show",        "Visar verktygstips även när vikt verktyget inte används." )
localify.Bind( "sv-se", prefix.."help_tooltip_scale",       "Bestämmer storleken av verktygstips när HUD:en genereras." )
localify.Bind( "sv-se", prefix.."help_tooltip_legacy",      "Tillåt en något modifierad verktygstips använd i äldre versioner av Garry's Mod." )
localify.Bind( "sv-se", prefix.."help_notifs",              "Tillåt hjälpsamma notifikationer vid applicering, kopiering, eller återställning av enhetens vikt." )
localify.Bind( "sv-se", prefix.."help_notifs_sound",        "Tillåt notifikationsljuden när vikt appliceras till en enhet." )
-- HUD Text
localify.Bind( "sv-se", prefix.."hud_original",             "Orginal" )
localify.Bind( "sv-se", prefix.."hud_modified",             "Modifierad" )
-- Notifications
localify.Bind( "sv-se", prefix.."notif_applied",            "Applicerad vikt" )
localify.Bind( "sv-se", prefix.."notif_copied",             "Kopierad Vikt" )
localify.Bind( "sv-se", prefix.."notif_restored",           "Återställ orginal vikt" )

--[[--------------------------------------------------------------------------
-- Japanese Localization
-- Big thanks to daigennki/seihai (STEAM_0:1:43031440) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "ja", prefix.."name",                     "重量 - 改良版" )
localify.Bind( "ja", prefix.."desc",                     "エンティティの重量を変更します。" )
localify.Bind( "ja", prefix.."0",                        "左クリック: 重量を適用する | 右クリック: 重量をコピーする | リロード: 重量をリセットする" )

-- Errors
localify.Bind( "ja", prefix.."error_zero_weight",        "適用される重量は0以上である必要があります" )
localify.Bind( "ja", prefix.."error_invalid_phys",       "このエンティティには有効な物理オブジェクトが存在しません（重量は変更できません）" )
localify.Bind( "ja", prefix.."error_max_weight",         "重量は最高値を超えられません" )
-- Labels
localify.Bind( "ja", prefix.."label_colorscale",         "カラースケール: " )
localify.Bind( "ja", prefix.."label_weight",             "重量: " )
localify.Bind( "ja", prefix.."label_decimals",           "小数点: " )
localify.Bind( "ja", prefix.."label_tooltip_scale",      "ツールチップの大きさ: " )
localify.Bind( "ja", prefix.."label_language",           "言語: " )
localify.Bind( "ja", prefix.."label_credits",            "daigennki/seihai (STEAM_0:1:43031440)による日本語訳" )
-- Checkboxes
localify.Bind( "ja", prefix.."checkbox_round",           "ツールチップで端数をなくした重量を表示する" )
localify.Bind( "ja", prefix.."checkbox_tooltip_show",    "常にツールチップを表示する" )
localify.Bind( "ja", prefix.."checkbox_tooltip_legacy",  "レガシーツールチップを使用する" )
localify.Bind( "ja", prefix.."checkbox_notifs",          "通知を表示する" )
localify.Bind( "ja", prefix.."checkbox_notifs_sound",    "通知音を再生する" )
-- Comboboxes
localify.Bind( "ja", prefix.."combobox_green_to_red",    "緑から赤" )
localify.Bind( "ja", prefix.."combobox_green_to_yellow", "緑から黄色" )
localify.Bind( "ja", prefix.."combobox_green_to_blue",   "緑から青" )
localify.Bind( "ja", prefix.."combobox_blue_to_red",     "青から赤" )
localify.Bind( "ja", prefix.."combobox_none",            "なし" )

localify.Bind( "ja", prefix.."combobox_minimum",         "最小" )
localify.Bind( "ja", prefix.."combobox_maximum",         "最高" )
localify.Bind( "ja", prefix.."combobox_default",         "既定" )
-- Descriptions
localify.Bind( "ja", prefix.."help_colorscale",          "エンティティの現在の重量を表す色のハローをエンティティの周りに追加します。各色は最小から最高までを表します。" )
localify.Bind( "ja", prefix.."help_decimals",            "HUDで重量が表示される時の小数点の最下位を設定します。0に設定された場合、最後まで表示されます。" )
localify.Bind( "ja", prefix.."help_tooltip_show",        "重量ツールが使用されていなくてもツールチップを表示する。" )
localify.Bind( "ja", prefix.."help_tooltip_scale",       "HUDが描画される時のツールチップの大きさを設定します。" )
localify.Bind( "ja", prefix.."help_tooltip_legacy",      "GarrysModの古いバージョンで使用されていたツールチップを有効にします。" )
localify.Bind( "ja", prefix.."help_notifs",              "エンティティの重量が適用、コピー、またはリセットされた時の通知の表示を有効にします。" )
localify.Bind( "ja", prefix.."help_notifs_sound",        "エンティティの重量が適用された時の通知音の再生を有効にします。" )
-- HUD Text
localify.Bind( "ja", prefix.."hud_original",             "既定" )
localify.Bind( "ja", prefix.."hud_modified",             "変更版" )
-- Notifications
localify.Bind( "ja", prefix.."notif_applied",            "重量が適用されました" )
localify.Bind( "ja", prefix.."notif_copied",             "重量がコピーされました" )
localify.Bind( "ja", prefix.."notif_restored",           "元の重量に戻されました" )

--[[--------------------------------------------------------------------------
-- Dutch Localization
-- Big thanks to Bunny (STEAM_0:1:34698490) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "nl", prefix.."name",                     "Gewicht - Verbeterd" )
localify.Bind( "nl", prefix.."desc",                     "Verandert het gewicht van een object" )
localify.Bind( "nl", prefix.."0",                        "Primair: Pas gewicht toe  |  Secundair: Kopieer gewicht  |  R (reload): Reset gewicht" )
-- Errors
localify.Bind( "nl", prefix.."error_zero_weight",        "Je moet een gewicht toepassen dat meer weegt dan 0" )
localify.Bind( "nl", prefix.."error_invalid_phys",       "Je kan het gewicht van dit object niet veranderen" )
localify.Bind( "nl", prefix.."error_max_weight",         "Gewicht kan het maximale niet overschrijden" )
-- Labels
localify.Bind( "nl", prefix.."label_colorscale",         "Kleuren Selectie: " )
localify.Bind( "nl", prefix.."label_weight",             "Gewicht: " )
localify.Bind( "nl", prefix.."label_decimals",           "Decimalen Mogelijkheden: " )
localify.Bind( "nl", prefix.."label_tooltip_scale",      "Tooltip Grote: " )
localify.Bind( "nl", prefix.."label_language",           "Taal: " )
localify.Bind( "nl", prefix.."label_credits",            "Nederlandse vertaling door Bunny (STEAM_0:1:34698490)" )
-- Checkboxes
localify.Bind( "nl", prefix.."checkbox_round",           "Laat afgeronde gewichten zien in de tooltip" )
localify.Bind( "nl", prefix.."checkbox_tooltip_show",    "Laat tooltip altijd zien" )
localify.Bind( "nl", prefix.."checkbox_tooltip_legacy",  "Gebruik de oude tooltip" )
localify.Bind( "nl", prefix.."checkbox_notifs",          "Laat notificaties zien" )
localify.Bind( "nl", prefix.."checkbox_notifs_sound",    "Speel notificatie geluiden" )
-- Comboboxes
localify.Bind( "nl", prefix.."combobox_green_to_red",    "Groen naar Rood" )
localify.Bind( "nl", prefix.."combobox_green_to_yellow", "Groen naar Geel" )
localify.Bind( "nl", prefix.."combobox_green_to_blue",   "Groen naar Blauw" )
localify.Bind( "nl", prefix.."combobox_blue_to_red",     "Blauw naar Rood" )
localify.Bind( "nl", prefix.."combobox_none",            "Geen" )

localify.Bind( "nl", prefix.."combobox_minimum",         "Minimaal" )
localify.Bind( "nl", prefix.."combobox_maximum",         "Maximaal" )
localify.Bind( "nl", prefix.."combobox_default",         "Standaart" )
-- Descriptions
localify.Bind( "nl", prefix.."help_colorscale",          "Voegt een halo toe rond het object met een kleur die het huidige gewicht weergeeft." )
localify.Bind( "nl", prefix.."help_decimals",            "Bepaalt hoeveel decimalen er zullen worden gebruikt om het gewicht weer te geven in de HUD. Nul betekent dat er alleen ronde getallen worden gebruikt." )
localify.Bind( "nl", prefix.."help_tooltip_show",        "Laat de tooltip zien zelfs als de weight tool niet word gebruikt." )
localify.Bind( "nl", prefix.."help_tooltip_scale",       "Bepaalt de grote van de tooltip in de HUD." )
localify.Bind( "nl", prefix.."help_tooltip_legacy",      "Verandert de tooltip HUD die werd gebruikt in oudere versies van Garry’s Mod." )
localify.Bind( "nl", prefix.."help_notifs",              "Geeft handige notificaties weer wanneer je een gewicht, kopieert, reset of toepast." )
localify.Bind( "nl", prefix.."help_notifs_sound",        "Maakt een notificatie geluid wanneer je een gewicht toepast." )
-- HUD Text
localify.Bind( "nl", prefix.."hud_original",             "Origineel" )
localify.Bind( "nl", prefix.."hud_modified",             "Toegepast" )
-- Notifications
localify.Bind( "nl", prefix.."notif_applied",            "Gewicht toegepast" )
localify.Bind( "nl", prefix.."notif_copied",             "Gewicht gekopieerd" )
localify.Bind( "nl", prefix.."notif_restored",           "Originele gewicht terug gezet" )

--[[--------------------------------------------------------------------------
-- Polish Localization
-- Big thanks to Sarian (STEAM_0:0:34104920) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "pl", prefix.."name",                     "Ciężar - Ulepszony" )
localify.Bind( "pl", prefix.."desc",                     "Zmienia ciężar obiektu" )
localify.Bind( "pl", prefix.."0",                        "LPM: Zastosuj ciężar  |  PPM: Skopiuj ciężar |  R: Zresetuj ciężar" )
-- Errors
localify.Bind( "pl", prefix.."error_zero_weight",        "Ciężar musi być większy od 0" )
localify.Bind( "pl", prefix.."error_invalid_phys",       "Ten obiekt nie posiada modelu fizycznego (nie można zmodyfikować  ciężaru)" )
localify.Bind( "pl", prefix.."error_max_weight",         "Ciężar nie może przekraczać maximum" )
-- Labels
localify.Bind( "pl", prefix.."label_colorscale",         "Skala Koloru: " )
localify.Bind( "pl", prefix.."label_weight",             "Ciężar: " )
localify.Bind( "pl", prefix.."label_decimals",           "Miejsca Po Przecinku: " )
localify.Bind( "pl", prefix.."label_tooltip_scale",      "Skala Podpowiedzi: " )
localify.Bind( "pl", prefix.."label_language",           "Język: " )
localify.Bind( "pl", prefix.."label_credits",            "Tłumaczenie polsko przez Sarian (STEAM_0:0:34104920)" )
-- Checkboxes
localify.Bind( "pl", prefix.."checkbox_round",           "Wyświetlaj zaokrąglony ciężar w podpowiedzi" )
localify.Bind( "pl", prefix.."checkbox_tooltip_show",    "Zawsze pokazuj podpowiedź" )
localify.Bind( "pl", prefix.."checkbox_tooltip_legacy",  "Użyj starej skali" )
localify.Bind( "pl", prefix.."checkbox_notifs",          "Wyświetlaj powiadomienia" )
localify.Bind( "pl", prefix.."checkbox_notifs_sound",    "Odtwarzaj dźwięk powiadomienia" )
-- Comboboxes
localify.Bind( "pl", prefix.."combobox_green_to_red",    "Zielony do Czerwonego" )
localify.Bind( "pl", prefix.."combobox_green_to_yellow", "Zielony do żółtego" )
localify.Bind( "pl", prefix.."combobox_green_to_blue",   "Zielony do Niebieskiego" )
localify.Bind( "pl", prefix.."combobox_blue_to_red",     "Niebieski do Czerwonego" )
localify.Bind( "pl", prefix.."combobox_none",            "żaden" )

localify.Bind( "pl", prefix.."combobox_minimum",         "Minimum" )
localify.Bind( "pl", prefix.."combobox_maximum",         "Maximum" )
localify.Bind( "pl", prefix.."combobox_default",         "Domyślny" )
-- Descriptions
localify.Bind( "pl", prefix.."help_colorscale",          "Dodaje poświatę około obiektu z kolorem reprezentującym  jego obecny ciężar. Kolory zmieniają się odpowiednio od minimum do maximum." )
localify.Bind( "pl", prefix.."help_decimals",            "Ustala do ilu miejsc po przecinku ciężar powinien zostać zaokrąglony podczas wyświetlania na ekranie. Zero oznacza pełne liczby." )
localify.Bind( "pl", prefix.."help_tooltip_show",        "Pokaż podpowiedź nawet jeśli narzędzie wagi nie jest używane." )
localify.Bind( "pl", prefix.."help_tooltip_scale",       "Ustawia rozmiar podpowiedzi rysowanej na ekranie." )
localify.Bind( "pl", prefix.."help_tooltip_legacy",      "Włącza lekko zmodyfikowaną podpowiedź używaną w starszych wersjach Garry's Moda" )
localify.Bind( "pl", prefix.."help_notifs",              "Włącza pomocną podpowiedź podczas zastosowywania, kopiowania lub resetowania ciężaru obiektu." )
localify.Bind( "pl", prefix.."help_notifs_sound",        "Włącza powiadomienia dźwiękowe podczas zastosowywania ciężaru do obiektu" )
-- HUD Text
localify.Bind( "pl", prefix.."hud_original",             "Oryginalny" )
localify.Bind( "pl", prefix.."hud_modified",             "Zmodyfikowany" )
-- Notifications
localify.Bind( "pl", prefix.."notif_applied",            "Zastosowano ciężar" )
localify.Bind( "pl", prefix.."notif_copied",             "Skopiowano ciężar" )
localify.Bind( "pl", prefix.."notif_restored",           "Przywrócono oryginalny ciężar" )

--[[--------------------------------------------------------------------------
-- German Localization
-- Big thanks to Time SchocK (STEAM_0:1:12054113) for these translations!
--------------------------------------------------------------------------]]--

-- Tool Settings
localify.Bind( "de", prefix.."name",                     "Masse - Verbessert" )
localify.Bind( "de", prefix.."desc",                     "Ändert die Masse eines Objekts" )
localify.Bind( "de", prefix.."0",                        "Primär: Masse ändern  |  Sekundär: Masse kopieren |  Nachladen: Masse zurücksetzen" )
-- Errors
localify.Bind( "de", prefix.."error_zero_weight",        "Du musst eine Masse größer 0 wählen" )
localify.Bind( "de", prefix.."error_invalid_phys",       "Dieses Objekt hat kein gültiges 'physics object' (Masse kann nicht geändert werden)" )
localify.Bind( "de", prefix.."error_max_weight",         "Masse darf nicht größer als max sein" )
-- Labels
localify.Bind( "de", prefix.."label_colorscale",         "Farbenskalierung:" )
localify.Bind( "de", prefix.."label_weight",             "Masse: " )
localify.Bind( "de", prefix.."label_decimals",           "Dezimalstellen: " )
localify.Bind( "de", prefix.."label_tooltip_scale",      "Tooltipskalierung: " )
localify.Bind( "de", prefix.."label_language",           "Sprache: " )
localify.Bind( "de", prefix.."label_credits",            "Deutsche Übersetzung von Time SchocK (STEAM_0:1:12054113)"
-- Checkboxes
localify.Bind( "de", prefix.."checkbox_round",           "Gerundete Masse im Tooltip anzeigen" )
localify.Bind( "de", prefix.."checkbox_tooltip_show",    "Tooltip immer anzeigen" )
localify.Bind( "de", prefix.."checkbox_tooltip_legacy",  "Legacy Tooltip benutzen" )
localify.Bind( "de", prefix.."checkbox_notifs",          "Benachrichtigungen anzeigen" )
localify.Bind( "de", prefix.."checkbox_notifs_sound",    "Benachrichtigungssounds" )
-- Comboboxes
localify.Bind( "de", prefix.."combobox_green_to_red",    "Grün nach Rot" )
localify.Bind( "de", prefix.."combobox_green_to_yellow", "Grün nach Gelb" )
localify.Bind( "de", prefix.."combobox_green_to_blue",   "Grün nach Blau" )
localify.Bind( "de", prefix.."combobox_blue_to_red",     "Blau nach Rot" )
localify.Bind( "de", prefix.."combobox_none",            "Keine" )

localify.Bind( "de", prefix.."combobox_minimum",         "Minimum" )
localify.Bind( "de", prefix.."combobox_maximum",         "Maximum" )
localify.Bind( "de", prefix.."combobox_default",         "Standard" )
-- Descriptions
localify.Bind( "de", prefix.."help_colorscale",          "Zeigt einen Lichtschein um das gewählte Objekt. Die Farbe des Scheins entspricht der Masse des Objekts. Je schwerer die Masse desto stärker die zweite Farbe und umgekehrt." )
localify.Bind( "de", prefix.."help_decimals",            "Bestimmt auf wie viele Dezimalstellen die Masse im HUD gerundet wird. Bei NULL werden nur ganze Zahlen dargestellt." )
localify.Bind( "de", prefix.."help_tooltip_show",        "Zeigt den Tooltip auch wenn das Tool nicht benutzt wird." )
localify.Bind( "de", prefix.."help_tooltip_scale",       "Bestimmt die Größe des Tooltips" )
localify.Bind( "de", prefix.."help_tooltip_legacy",      "Zeigt einen leicht veränderten Tooltip, der in älteren Versionen von Garry's Mod benutzt wurde" )
localify.Bind( "de", prefix.."help_notifs",              "Zeigt hilfreiche Benachrichtigungen beim Ändern, Kopieren und Zurücksetzen der Masse eines Objekts" )
localify.Bind( "de", prefix.."help_notifs_sound",        "Spielt einen Ton, wenn das Gewicht geändert wird" )
-- HUD Text
localify.Bind( "de", prefix.."hud_original",             "Original" )
localify.Bind( "de", prefix.."hud_modified",             "Geändert" )
-- Notifications
localify.Bind( "de", prefix.."notif_applied",            "Masse verändert" )
localify.Bind( "de", prefix.."notif_copied",             "Masse kopiert" )
localify.Bind( "de", prefix.."notif_restored",           "Masse zurückgesetzt" )

--[[--------------------------------------------------------------------------
-- <Other> Localization
--------------------------------------------------------------------------]]--
--[[
-- Tool Settings
localify.Bind( "", prefix.."name",                     "" )
localify.Bind( "", prefix.."desc",                     "" )
localify.Bind( "", prefix.."0",                        "" )
-- Errors
localify.Bind( "", prefix.."error_zero_weight",        "" )
localify.Bind( "", prefix.."error_invalid_phys",       "" )
localify.Bind( "", prefix.."error_max_weight",         "" )
-- Labels
localify.Bind( "", prefix.."label_colorscale",         "" )
localify.Bind( "", prefix.."label_weight",             "" )
localify.Bind( "", prefix.."label_decimals",           "" )
localify.Bind( "", prefix.."label_tooltip_scale",      "" )
localify.Bind( "", prefix.."label_language",           "" )
localify.Bind( "", prefix.."label_credits",            "" )
-- Checkboxes
localify.Bind( "", prefix.."checkbox_round",           "" )
localify.Bind( "", prefix.."checkbox_tooltip_show",    "" )
localify.Bind( "", prefix.."checkbox_tooltip_legacy",  "" )
localify.Bind( "", prefix.."checkbox_notifs",          "" )
localify.Bind( "", prefix.."checkbox_notifs_sound",    "" )
-- Comboboxes
localify.Bind( "", prefix.."combobox_green_to_red",    "" )
localify.Bind( "", prefix.."combobox_green_to_yellow", "" )
localify.Bind( "", prefix.."combobox_green_to_blue",   "" )
localify.Bind( "", prefix.."combobox_blue_to_red",     "" )
localify.Bind( "", prefix.."combobox_none",            "" )

localify.Bind( "", prefix.."combobox_minimum",         "" )
localify.Bind( "", prefix.."combobox_maximum",         "" )
localify.Bind( "", prefix.."combobox_default",         "" )
-- Descriptions
localify.Bind( "", prefix.."help_colorscale",          "" )
localify.Bind( "", prefix.."help_decimals",            "" )
localify.Bind( "", prefix.."help_tooltip_show",        "" )
localify.Bind( "", prefix.."help_tooltip_scale",       "" )
localify.Bind( "", prefix.."help_tooltip_legacy",      "" )
localify.Bind( "", prefix.."help_notifs",              "" )
localify.Bind( "", prefix.."help_notifs_sound",        "" )
-- HUD Text
localify.Bind( "", prefix.."hud_original",             "" )
localify.Bind( "", prefix.."hud_modified",             "" )
-- Notifications
localify.Bind( "", prefix.."notif_applied",            "" )
localify.Bind( "", prefix.."notif_copied",             "" )
localify.Bind( "", prefix.."notif_restored",           "" )
]]

-- Hopefully will add more with community/crowdsource support.

-- If you are multi/bilingual, please consider helping me translate the phrases above into other languages.
-- Create an issue on the Github page ( https://github.com/Mista-Tea/improved-weight ) or
-- add me on Steam ( http://steamcommunity.com/profiles/76561198015280374 ). Thanks!