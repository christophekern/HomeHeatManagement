function Mode_ECO(debug, zone)
if debug then print ("** fonction Mode ECO pour zone :" .. zone .. "**"); end
	if (zone == "salon") then
		if (otherdevices[NameInter_SalonECO]=='Off') then
              		if debug then print("SALON : mode ECO"); end
                 	commandArray[NameInter_SalonECO] = 'On'
		end
                if (otherdevices[NameInter_SalonConfort]=='On') then commandArray[NameInter_SalonConfort] = 'Off'; end;
		if (otherdevices[NameInter_SalonHorsGel]=='On') then commandArray[NameInter_SalonHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_SalonArret]=='On') then commandArray[NameInter_SalonArret] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort1]=='On') then commandArray[NameInter_SalonConfort1] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort2]=='On') then commandArray[NameInter_SalonConfort2] = 'Off'; end;
		
		-- gestion du fil pilote a faire ICI
		if ((tonumber(otherdevices_svalues[NameFP_Salon]) < 21) or (tonumber(otherdevices_svalues[NameFP_Salon]) > 30)) then
                        if debug then print("Fonction ECO : Mise du niveau de FP Salon a 25"); end
                        -- eco entre 21 et 30
                        commandArray[NameFP_Salon]='Set Level 25'
                end

		if ( uservariables[NameVarSalon] ~= "ECO" ) then
			upVar = "Variable:" .. NameVarSalon
			commandArray[upVar]= "ECO"
		end
		
		else
		-- zone nuit
		if (otherdevices[NameInter_NuitECO]=='Off') then
                        if debug then print("Nuit : mode ECO"); end
                        commandArray[NameInter_NuitECO] = 'On'
                end
                if (otherdevices[NameInter_NuitConfort]=='On') then commandArray[NameInter_NuitConfort] = 'Off'; end;
                if (otherdevices[NameInter_NuitHorsGel]=='On') then commandArray[NameInter_NuitHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_NuitArret]=='On') then commandArray[NameInter_NuitArret] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort1]=='On') then commandArray[NameInter_NuitConfort1] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort2]=='On') then commandArray[NameInter_NuitConfort2] = 'Off'; end;

                -- gestion du fil pilote a faire ICI
                if ((tonumber(otherdevices_svalues[NameFP_Nuit]) < 21) or (tonumber(otherdevices_svalues[NameFP_Nuit]) > 30)) then
                        if debug then print("Fonction ECO : Mise du niveau de FP Nuit a 25"); end
                        -- eco entre 21 et 30
                        commandArray[NameFP_Nuit]='Set Level 25'
                end

		if ( uservariables[NameVarNuit] ~= "ECO" ) then
                        upVar = "Variable:" .. NameVarNuit
                        commandArray[upVar]= "ECO"
                end

	end

end

function Mode_CONFORT(debug, zone)
if debug then print ("** fonction Mode CONFORT pour zone :" .. zone .. "**"); end
	if (zone == "salon") then
                if (otherdevices[NameInter_SalonConfort]=='Off') then
                        if debug then print("SALON : forcage switch mode confort"); end
                        commandArray[NameInter_SalonConfort] = 'On'
		-- suppression des autres modes si necessaire
                end
		if (otherdevices[NameInter_SalonECO]=='On') then commandArray[NameInter_SalonECO] = 'Off'; end;
                if (otherdevices[NameInter_SalonHorsGel]=='On') then commandArray[NameInter_SalonHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_SalonArret]=='On') then commandArray[NameInter_SalonArret] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort1]=='On') then commandArray[NameInter_SalonConfort1] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort2]=='On') then commandArray[NameInter_SalonConfort2] = 'Off'; end;

			-- gestion du fil pilote a faire ICI

                if (tonumber(otherdevices_svalues[NameFP_Salon]) < 51 ) then
                        if debug then print("Fonction Confort : Mise du niveau de FP Salon a 70"); end
			-- confort entre 51 et 99
                        commandArray[NameFP_Salon]='Set Level 70'
                end

		if ( uservariables[NameVarSalon] ~= "CONFORT" ) then
                        upVar = "Variable:" .. NameVarSalon
                        commandArray[upVar]= "CONFORT"
                end


        else
                -- zone nuit
		if (otherdevices[NameInter_NuitConfort]=='Off') then
                        if debug then print("Nuit : forcage switch mode confort"); end
                        commandArray[NameInter_NuitConfort] = 'On'
                -- suppression des autres modes si necessaire
                end
                if (otherdevices[NameInter_NuitECO]=='On') then commandArray[NameInter_NuitECO] = 'Off'; end;
                if (otherdevices[NameInter_NuitHorsGel]=='On') then commandArray[NameInter_NuitHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_NuitArret]=='On') then commandArray[NameInter_NuitArret] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort1]=='On') then commandArray[NameInter_NuitConfort1] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort2]=='On') then commandArray[NameInter_NuitConfort2] = 'Off'; end;

                        -- gestion du fil pilote a faire ICI

                if (tonumber(otherdevices_svalues[NameFP_Nuit]) < 51 ) then
                        if debug then print("Fonction Confort : Mise du niveau de FP Nuit a 70"); end
                        -- confort entre 51 et 99
                        commandArray[NameFP_Nuit]='Set Level 70'
                end

                if ( uservariables[NameVarNuit] ~= "CONFORT" ) then
                        upVar = "Variable:" .. NameVarNuit
                        commandArray[upVar]= "CONFORT"
                end


        end
end

function Mode_OFF(debug, zone)
if debug then print ("** fonction Mode OFF pour zone :" .. zone .. "**"); end
        if (zone == "salon") then
                if (otherdevices[NameInter_SalonArret]=='Off') then
                        if debug then print("SALON : mode ARRET"); end
                        commandArray[NameInter_SalonArret] = 'On'
                end
		if (otherdevices[NameInter_SalonConfort]=='On') then commandArray[NameInter_SalonConfort] = 'Off'; end;
		if (otherdevices[NameInter_SalonHorsGel]=='On') then commandArray[NameInter_SalonHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort1]=='On') then commandArray[NameInter_SalonConfort1] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort2]=='On') then commandArray[NameInter_SalonConfort2] = 'Off'; end;
		if (otherdevices[NameInter_SalonECO]=='On') then commandArray[NameInter_SalonECO] = 'Off'; end;
                        -- gestion du fil pilote a faire ICI
                if (tonumber(otherdevices_svalues[NameFP_Salon]) > 10) then
                        if debug then print("Fonction OFF : Mise du niveau de FP Salon a 5"); end
                        -- OFF entre 0 et 10
                        commandArray[NameFP_Salon]='Set Level 5'
                end

		if ( uservariables[NameVarSalon] ~= "OFF" ) then
                        upVar = "Variable:" .. NameVarSalon
                        commandArray[upVar]= "OFF"
                end

        else
                -- zone nuit
                if (otherdevices[NameInter_NuitArret]=='Off') then
                        if debug then print("Nuit : mode ARRET"); end
                        commandArray[NameInter_NuitArret] = 'On'
                end
                if (otherdevices[NameInter_NuitConfort]=='On') then commandArray[NameInter_NuitConfort] = 'Off'; end;
                if (otherdevices[NameInter_NuitHorsGel]=='On') then commandArray[NameInter_NuitHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort1]=='On') then commandArray[NameInter_NuitConfort1] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort2]=='On') then commandArray[NameInter_NuitConfort2] = 'Off'; end;
                if (otherdevices[NameInter_NuitECO]=='On') then commandArray[NameInter_NuitECO] = 'Off'; end;
                        -- gestion du fil pilote a faire ICI
                if (tonumber(otherdevices_svalues[NameFP_Nuit]) > 10) then
                        if debug then print("Fonction OFF : Mise du niveau de FP Nuit a 5"); end
                        -- OFF entre 0 et 10
                        commandArray[NameFP_Nuit]='Set Level 5'
                end

                if ( uservariables[NameVarNuit] ~= "OFF" ) then
                        upVar = "Variable:" .. NameVarNuit
                        commandArray[upVar]= "OFF"
                end


        end

end

function Mode_HorsGel(debug, zone)
if debug then print ("**Fonction Mode Hors Gel pour zone :" .. zone .. "**"); end
        if (zone == "salon") then
                if (otherdevices[NameInter_SalonHorsGel]=='Off') then
                        if debug then print("SALON : mode Hors Gel"); end
                        commandArray[NameInter_SalonHorsGel] = 'On'
                end
		if (otherdevices[NameInter_SalonConfort]=='On') then commandArray[NameInter_SalonConfort] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort1]=='On') then commandArray[NameInter_SalonConfort1] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort2]=='On') then commandArray[NameInter_SalonConfort2] = 'Off'; end;
                if (otherdevices[NameInter_SalonECO]=='On') then commandArray[NameInter_SalonECO] = 'Off'; end;
                if (otherdevices[NameInter_SalonArret]=='On') then commandArray[NameInter_SalonArret] = 'Off'; end;

                        -- gestion du fil pilote a faire ICI
 		if ((tonumber(otherdevices_svalues[NameFP_Salon]) < 11) or (tonumber(otherdevices_svalues[NameFP_Salon]) > 21)) then
                        if debug then print("Fonction Hors Gel : Mise du niveau de FP Salon a 15"); end
                        -- Hors gel entre 11 et 21
                        commandArray[NameFP_Salon]='Set Level 15'
                end

		if ( uservariables[NameVarSalon] ~= "Hors GEL" ) then
                        upVar = "Variable:" .. NameVarSalon
                        commandArray[upVar]= "Hors GEL"
                end


        else
                -- zone nuit
               if (otherdevices[NameInter_NuitHorsGel]=='Off') then
                        if debug then print("Nuit : mode Hors Gel"); end
                        commandArray[NameInter_NuitHorsGel] = 'On'
                end
                if (otherdevices[NameInter_NuitConfort]=='On') then commandArray[NameInter_NuitConfort] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort1]=='On') then commandArray[NameInter_NuitConfort1] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort2]=='On') then commandArray[NameInter_NuitConfort2] = 'Off'; end;
                if (otherdevices[NameInter_NuitECO]=='On') then commandArray[NameInter_NuitECO] = 'Off'; end;
                if (otherdevices[NameInter_NuitArret]=='On') then commandArray[NameInter_NuitArret] = 'Off'; end;

                        -- gestion du fil pilote a faire ICI
                if ((tonumber(otherdevices_svalues[NameFP_Nuit]) < 11) or (tonumber(otherdevices_svalues[NameFP_Nuit]) > 21)) then
                        if debug then print("Fonction Hors Gel : Mise du niveau de FP Nuit a 15"); end
                        -- Hors gel entre 11 et 21
                        commandArray[NameFP_Nuit]='Set Level 15'
                end
		
		if ( uservariables[NameVarNuit] ~= "Hors GEL" ) then
                        upVar = "Variable:" .. NameVarNuit
                        commandArray[upVar]= "Hors GEL"
                end
        end

end

function Mode_Confort1(debug, zone)
if debug then print ("** Fonction Mode CONFORT-1 pour zone :" .. zone .. "**"); end
        if (zone == "salon") then
                if (otherdevices[NameInter_SalonConfort1]=='Off') then
                        if debug then print("SALON : mode Confort-1"); end
                        commandArray[NameInter_SalonConfort1] = 'On'
                end
		if (otherdevices[NameInter_SalonConfort]=='On') then commandArray[NameInter_SalonConfort] = 'Off'; end;
                if (otherdevices[NameInter_SalonHorsGel]=='On') then commandArray[NameInter_SalonHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort2]=='On') then commandArray[NameInter_SalonConfort2] = 'Off'; end;
                if (otherdevices[NameInter_SalonECO]=='On') then commandArray[NameInter_SalonECO] = 'Off'; end;
                if (otherdevices[NameInter_SalonArret]=='On') then commandArray[NameInter_SalonArret] = 'Off'; end;

                        -- gestion du fil pilote a faire ICI
 		if ((tonumber(otherdevices_svalues[NameFP_Salon]) < 41) or (tonumber(otherdevices_svalues[NameFP_Salon]) > 50)) then
                        if debug then print("Fonction Confort-1 : Mise du niveau de FP Salon a 45"); end
                        -- Hors gel entre 41 et 50
                        commandArray[NameFP_Salon]='Set Level 45'
                end

		if ( uservariables[NameVarSalon] ~= "CONFORT-1" ) then
                        upVar = "Variable:" .. NameVarSalon
                        commandArray[upVar]= "CONFORT-1"
                end

        else
                -- zone nuit
                if (otherdevices[NameInter_NuitConfort1]=='Off') then
                        if debug then print("Nuit : mode Confort-1"); end
                        commandArray[NameInter_NuitConfort1] = 'On'
                end
                if (otherdevices[NameInter_NuitConfort]=='On') then commandArray[NameInter_NuitConfort] = 'Off'; end;
                if (otherdevices[NameInter_NuitHorsGel]=='On') then commandArray[NameInter_NuitHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort2]=='On') then commandArray[NameInter_NuitConfort2] = 'Off'; end;
                if (otherdevices[NameInter_NuitECO]=='On') then commandArray[NameInter_NuitECO] = 'Off'; end;
                if (otherdevices[NameInter_NuitArret]=='On') then commandArray[NameInter_NuitArret] = 'Off'; end;

                        -- gestion du fil pilote a faire ICI
                if ((tonumber(otherdevices_svalues[NameFP_Nuit]) < 41) or (tonumber(otherdevices_svalues[NameFP_Nuit]) > 50)) then
                        if debug then print("Fonction Confort-1 : Mise du niveau de FP Nuit a 45"); end
                        -- Hors gel entre 41 et 50
                        commandArray[NameFP_Nuit]='Set Level 45'
                end

                if ( uservariables[NameVarNuit] ~= "CONFORT-1" ) then
                        upVar = "Variable:" .. NameVarNuit
                        commandArray[upVar]= "CONFORT-1"
                end


        end

end

function Mode_Confort2(debug, zone)
if debug then print ("**Fonction Mode CONFORT-2 pour zone :" .. zone .. "**"); end
        if (zone == "salon") then
                if (otherdevices[NameInter_SalonConfort2]=='Off') then
                        if debug then print("SALON : mode Confort-2"); end
                        commandArray[NameInter_SalonConfort2] = 'On'
                end
		if (otherdevices[NameInter_SalonConfort]=='On') then commandArray[NameInter_SalonConfort] = 'Off'; end;
                if (otherdevices[NameInter_SalonHorsGel]=='On') then commandArray[NameInter_SalonHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_SalonConfort1]=='On') then commandArray[NameInter_SalonConfort1] = 'Off'; end;
                if (otherdevices[NameInter_SalonECO]=='On') then commandArray[NameInter_SalonECO] = 'Off'; end;
                if (otherdevices[NameInter_SalonArret]=='On') then commandArray[NameInter_SalonArret] = 'Off'; end;

                        -- gestion du fil pilote a faire ICI
		 if ((tonumber(otherdevices_svalues[NameFP_Salon]) < 31) or (tonumber(otherdevices_svalues[NameFP_Salon]) > 40)) then
                        if debug then print("Fonction Confort-2 : Mise du niveau de FP Salon a 35"); end
                        -- Hors gel entre 31 et 40
                        commandArray[NameFP_Salon]='Set Level 35'
                end
		if ( uservariables[NameVarSalon] ~= "CONFORT-2" ) then
                        upVar = "Variable:" .. NameVarSalon
                        commandArray[upVar]= "CONFORT-2"
                end

        else
                -- zone nuit
                if (otherdevices[NameInter_NuitConfort2]=='Off') then
                        if debug then print("Nuit : mode Confort-2"); end
                        commandArray[NameInter_NuitConfort2] = 'On'
                end
                if (otherdevices[NameInter_NuitConfort]=='On') then commandArray[NameInter_NuitConfort] = 'Off'; end;
                if (otherdevices[NameInter_NuitHorsGel]=='On') then commandArray[NameInter_NuitHorsGel] = 'Off'; end;
                if (otherdevices[NameInter_NuitConfort1]=='On') then commandArray[NameInter_NuitConfort1] = 'Off'; end;
                if (otherdevices[NameInter_NuitECO]=='On') then commandArray[NameInter_NuitECO] = 'Off'; end;
                if (otherdevices[NameInter_NuitArret]=='On') then commandArray[NameInter_NuitArret] = 'Off'; end;

                        -- gestion du fil pilote a faire ICI
                 if ((tonumber(otherdevices_svalues[NameFP_Nuit]) < 31) or (tonumber(otherdevices_svalues[NameFP_Nuit]) > 40)) then
                        if debug then print("Fonction Confort-2 : Mise du niveau de FP Nuit a 35"); end
                        -- Hors gel entre 31 et 40
                        commandArray[NameFP_Nuit]='Set Level 35'
                end

                if ( uservariables[NameVarNuit] ~= "CONFORT-2" ) then
                        upVar = "Variable:" .. NameVarNuit
                        commandArray[upVar]= "CONFORT-2"
                end


        end

end

commandArray = {}
debug = false
NameInter_ModeManuel = "Chauffage Mode Manuel"
NameInter_Absence = "Mode absent"
NameInter_AbsenceWE = "Mode absent WE"
NameInter_ModeWeekend = "Mode weekend"
NameInter_ModeSemaine = "Mode Semaine"
NameInter_CmdChauffeEau = "Cmd Chauffe eau"
NameInter_PresenceJournee = "Presence Journee"
NameInter_AbsenceMidi = "Absence Midi"


NameInter_SalonConfort = "Ch. Salon : Confort"
NameInter_SalonECO = "Ch. Salon : ECO"
NameInter_SalonHorsGel = "Ch. Salon : Hors Gel"
NameInter_SalonArret = "Ch. Salon : Arret"
NameInter_SalonConfort1 = "Ch. Salon : Confort-1"
NameInter_SalonConfort2 = "Ch. Salon : Confort-2"
NameFP_Salon = "Fil Pilote Zone Salon"
NameVarSalon = "Consigne_Salon"
 
NameInter_NuitConfort = "Ch. Nuit : Confort"
NameInter_NuitECO = "Ch. Nuit : ECO"
NameInter_NuitHorsGel = "Ch. Nuit : Hors Gel"
NameInter_NuitArret = "Ch. Nuit : Arret"
NameInter_NuitConfort1 = "Ch. Nuit : Confort-1"
NameInter_NuitConfort2 = "Ch. Nuit : Confort-2"
NameFP_Nuit = "Fil Pilote Zone Nuit"
NameVarNuit = "Consigne_Nuit"

HeureDebutNuit = "20:30"
HeureFinNuit = "07:00"
HeureDebutTravailMatin = "08:00"
HeureFinTravailMatin = "11:30"
HeureDebutTravailAM = "13:30"
HeureFinTravailAM = "17:30"

t1 = os.date("%H:%M")
-- t1 = "22:31"
 
if debug then print ("Test script kiki using variable and debug "); end
if debug then print ("Heure: " .. t1); end

if (otherdevices[NameInter_ModeManuel]=='On') then
	if debug then print ("Main : Mode MANUEL est ON "); end
	if (otherdevices[NameInter_Absence]=='On') then
		if debug then print ("Main : Mode MANUEL dc suppresion Absence "); end
		commandArray[NameInter_Absence] = 'Off'
	end
	if (otherdevices[NameInter_AbsenceWE]=='On') then
		if debug then print ("Main : Mode MANUEL dc suppresion Absence WE"); end
		commandArray[NameInter_AbsenceWE] = 'Off'
	end

	-- Gestion du salon

	if (otherdevices[NameInter_SalonConfort]=='On') then
		-- priorite donnee au confort
		if debug then print ("Main : Mode MANUEL et SALON mode CONFORT"); end
		
		-- passage en mode confort
		Mode_CONFORT(debug, "salon")
	else
        if (otherdevices[NameInter_SalonECO]=='On') then
                if debug then print ("Main : Mode MANUEL et SALON mode CONFORT"); end

		-- passage en mode ECO
                Mode_ECO(debug, "salon")
	else
	if (otherdevices[NameInter_SalonArret]=='On') then
                if debug then print ("Main : Mode MANUEL et SALON mode ARRET"); end

                -- passage en mode OFF
                 Mode_OFF(debug, "salon")
	else
	if (otherdevices[NameInter_SalonHorsGel]=='On') then
                if debug then print ("Main : Mode MANUEL et SALON mode HORS GEL"); end

                -- passage en mode Hors Gel
                 Mode_HorsGel(debug, "salon")
	else
	if (otherdevices[NameInter_SalonConfort1]=='On') then
                if debug then print ("Main : Mode MANUEL et SALON mode CONFORT - 1"); end

                -- passage en mode Confort-1 
		Mode_Confort1(debug, "salon")
	else
	if (otherdevices[NameInter_SalonConfort2]=='On') then
                if debug then print ("Main : Mode MANUEL et SALON mode CONFORT - 2"); end

                -- passage en mode Confort-2
		Mode_Confort2(debug, "salon")
	else
		-- aucun mode selectionne, mode par defaut = OFF
		 if debug then print ("Main : Mode MANUEL et Aucun mode selection => mode ARRET par defaut"); end
                -- passage en mode OFF
                 Mode_OFF(debug, "salon")
	end -- mode confort -2
	end -- mode confort - 1
	end -- mode hors gel
	end -- mode OFF
	end -- mode eco
	end -- mode confort

	-- Gestion du coin nuit
	if (otherdevices[NameInter_NuitConfort]=='On') then
                -- priorite donnee au confort
                if debug then print ("Main : Mode MANUEL et Nuit mode CONFORT"); end

                -- passage en mode confort
                Mode_CONFORT(debug, "Nuit")
        else
        if (otherdevices[NameInter_NuitECO]=='On') then
                if debug then print ("Main : Mode MANUEL et Nuit mode CONFORT"); end

                -- passage en mode ECO
                Mode_ECO(debug, "Nuit")
        else
        if (otherdevices[NameInter_NuitArret]=='On') then
                if debug then print ("Main : Mode MANUEL et Nuit mode ARRET"); end

                -- passage en mode OFF
                 Mode_OFF(debug, "Nuit")
        else
        if (otherdevices[NameInter_NuitHorsGel]=='On') then
                if debug then print ("Main : Mode MANUEL et Nuit mode HORS GEL"); end

                -- passage en mode Hors Gel
                 Mode_HorsGel(debug, "Nuit")
        else
        if (otherdevices[NameInter_NuitConfort1]=='On') then
                if debug then print ("Main : Mode MANUEL et Nuit mode CONFORT - 1"); end

                -- passage en mode Confort-1
                Mode_Confort1(debug, "Nuit")
        else
        if (otherdevices[NameInter_NuitConfort2]=='On') then
                if debug then print ("Main : Mode MANUEL et Nuit mode CONFORT - 2"); end

                -- passage en mode Confort-2
                Mode_Confort2(debug, "Nuit")
        else
                -- aucun mode selectionne, mode par defaut = OFF
                 if debug then print ("Main : Mode MANUEL et Aucun mode selection => mode ARRET par defaut"); end
                -- passage en mode OFF
                 Mode_OFF(debug, "Nuit")
        end -- mode confort -2
        end -- mode confort - 1
        end -- mode hors gel
        end -- mode OFF
        end -- mode eco
        end -- mode confort

else -- mode automatique (=pas manuel)
	if (otherdevices[NameInter_Absence]=='On') then
		if debug then print("Mode Absent On"); end

		-- pour plus de proprete on supprime le mode absenceWE s il est mis
		if (otherdevices[NameInter_AbsenceWE]=='On') then
			if debug then print("Main : Mode AbsentWE est en conflit avec le mode Absent, on le desactive"); end
			commandArray[NameInter_AbsenceWE] = 'Off';			
		end

		-- Mode HG en absence prolongee --
		Mode_HorsGel(debug,"salon")
		Mode_HorsGel(debug,"nuit")
		-- Fin mode HG en absence prolongee --
	
	else -- = pas mode absent
		if (otherdevices[NameInter_AbsenceWE]=='On') then
	                if debug then print("Mode Absent WE On"); end

	                -- Mode Eco en absence WE --
                	Mode_ECO(debug,"salon")
                	Mode_ECO(debug,"nuit")
                	-- Fin mode Eco en absence WE --

		else -- =pas mode absent et pas mode absentWE
			if debug then print("Mode Absent Off"); end

			if (otherdevices[NameInter_ModeWeekend] == 'On') then
				if debug then print("Mode Weekend ON"); end
				-- MODE WEEK-END --
					if ((t1 <= HeureFinNuit) or (t1 >= HeureDebutNuit)) then
						-- NUIT...
						if debug then print("Mode WEEKEND --> NUIT , Time:" .. t1 ); end
						-- mode ECO pour le salon, confort-1 pour le coin nuit
						Mode_ECO(debug, "salon")
						Mode_Confort1(debug, "nuit")
					else
						-- JOUR
						if debug then print("Mode WEEKEND --> JOUR, Time:" .. t1 ); end
						-- mode CONFORT pour les 2 zones
						Mode_CONFORT(debug, "salon")	
						Mode_CONFORT(debug, "nuit")	
					end
				-- FIN MODE WEEK-END --
			else
				if debug then print("Mode Weekend OFF = Mode Semaine"); end
				-- MODE SEMAINE --
				if (otherdevices[NameInter_PresenceJournee]=='On') then
					-- Presence Journee est a ON
					if debug then print("ATTENTION : presence journee est active --> annihilation des horaires de travail"); end
	                		if ((t1 <= HeureFinNuit) or (t1 >= HeureDebutNuit)) then
						-- NUIT...
						-- mode ECO pour le salon, confort-1 pour le coin nuit
						Mode_ECO(debug, "salon")
						Mode_Confort1(debug, "nuit")
					else
						-- JOUR
						Mode_CONFORT(debug, "nuit")	
						Mode_CONFORT(debug, "salon")
					end
				else
					-- Presence Journee est a OFF = journee de travail normale
					if ((t1 <= HeureFinNuit) or (t1 >= HeureDebutNuit)) then
						-- NUIT...
						-- mode ECO pour le salon, confort-1 pour le coin nuit
						Mode_ECO(debug, "salon")
						Mode_Confort1(debug, "nuit")
					else
						if ((t1 > HeureFinNuit) and (t1 <= HeureDebutTravailMatin)) then
							-- confort au reveil avant d aller au travail
							Mode_CONFORT(debug, "nuit")
							Mode_CONFORT(debug, "salon")						
						else
							if ((t1 > HeureDebutTravailMatin) and (t1 <= HeureFinTravailMatin)) then
								-- zone travail du matin
								-- confort - 1 pour le salon
								-- confort - 2 pour la nuit
								Mode_Confort1(debug, "salon")
								Mode_Confort2(debug, "nuit")
							else
								if ((otherdevices[NameInter_AbsenceMidi]=='Off') and (t1 > HeureFinTravailMatin) and (t1 <= HeureDebutTravailAM)) then
									-- Pause midi UNIQUEMENT si Interrupteur d'absence pas mis
									-- confort  pour le salon
									-- confort - 2 pour la nuit
									Mode_CONFORT(debug, "salon")
									Mode_Confort2(debug, "nuit")
								else
									if ((t1 >  HeureDebutTravailAM ) and (t1 <= HeureFinTravailAM )) then
										-- Zone travail de l aprem
										-- confort - 1 pour le salon
										-- confort - 2 pour la nuit
										Mode_Confort1(debug, "salon")
										Mode_Confort2(debug, "nuit")
									else
										if (t1 > HeureFinTravailAM ) then
											-- Zone apres le travail et avant la nuit
											Mode_CONFORT(debug, "nuit")
											Mode_CONFORT(debug, "salon")
										end -- (t1 > HeureFinTravailAM )
									end  -- ((t1 >  HeureDebutTravailAM ) and (t1 <= HeureFinTravailAM )) then
								end -- Pause midi 
							end -- zone travail du matin
						end -- confort au reveil avant d aller au travail
					end -- NUIT...
				end -- FIN MODE SEMAINE --
			end -- mode weekend
		end -- absence WE
	end -- mode absent
end -- mode manuel

return commandArray
