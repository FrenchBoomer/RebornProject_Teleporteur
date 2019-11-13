local Touches = {

        ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
        ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
        ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
        ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
        ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
        ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
        ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
        ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
        ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118

    }

ToucheClavier = Touches["F6"] -- Touche d'ouverture du menu
Langue = "fr" -- Choix de la langue (Français = fr, Anglais = en, Espagnol = es)
Administration = false -- NE PAS TOUCHER !!!!!!!
AffichageDuTexteFlotant = true -- Activer / Desactiver le texte au dessus des marqueurs
ActivationBlip = true -- Activer / Desactiver les blips
timer = 0 -- NE PAS TOUCHER !!!!!!!
current_coords = 0 -- NE PAS TOUCHER !!!!!!!

BlipID = 162 -- Choix du blip
BlipTaille = 0.6 -- Choix de la taille du blip
BlipCouleur = 83 -- Choix de la couleur du blip
BlipClignotant = true -- Option pour faire clignoter le blip

ListeBlanche = { -- whiteliste
    {steam= "steam:00000000000000000000000"},
    {steam= "steam:00000000000000000000000"},
    {steam= "steam:00000000000000000000000"},
    {steam= "steam:00000000000000000000000"},

}

Locales = {
    ['fr'] = {
        ['ouvrir'] = '~INPUT_SELECT_CHARACTER_FRANKLIN~ pour ouvrir 🔓',
        ['fermer'] = '~INPUT_SELECT_CHARACTER_FRANKLIN~ pour fermer 🔒',
        ['notifwhiteliste'] = '~r~Vous ne faites pas parti de la whiteliste~s~',
        ['refusvehicule'] = '~r~Vehicules refuser~s~',
    },

    ['en'] ={
        ['ouvrir'] = '~INPUT_SELECT_CHARACTER_FRANKLIN~ for open 🔓',
        ['fermer'] = '~INPUT_SELECT_CHARACTER_FRANKLIN~ for close 🔒',
        ['refusvehicule'] = '~r~Vehicle refuse~s~',
    },

    ['es'] ={
        ['ouvrir'] = '~INPUT_SELECT_CHARACTER_FRANKLIN~ para abrir 🔓',
        ['fermer'] = '~INPUT_SELECT_CHARACTER_FRANKLIN~ para cerca 🔒',
        ['refusvehicule'] = '~r~Basura del vehículo~s~',
    },
}

Coordonnees = {

    { x1 = -1009.940, y1 = -2984.340, z1 = 13.950, h1 = 241.750, x2 = 460.260, y2 = -994.230, z2 = 24.910, h2 = 273.890, verrouiller = true, whiteliste = false, vehicule = true, nom = "Cellule 1"},
    { x1 = -1012.610, y1 = -2989.210, z1 = 13.950, h1 = 241.750, x2 = 459.690, y2 = -997.790, z2 = 24.910, h2 = 273.890, verrouiller = true, whiteliste = false, vehicule = false, nom = "Cellule 2"},
    { x1 = -1015.220, y1 = -2994.220, z1 = 13.950, h1 = 241.750, x2 = 459.520, y2 = -1001.440, z2 = 24.910, h2 = 273.890, verrouiller = true, whiteliste = false, vehicule = false, nom = "Cellule 3"},
    { x1 = -1017.610, y1 = -2998.540, z1 = 13.950, h1 = 241.750, x2 = 450.540, y2 = -975.130, z2 = 30.690, h2 = 133.670, verrouiller = true, whiteliste = false, vehicule = false, nom = "Bureau 1"},
    { x1 = -1020.330, y1 = -3003.460, z1 = 13.950, h1 = 241.750, x2 = -75.750, y2 = -819.070, z2 = 326.180, h2 = 246.600, verrouiller = true, whiteliste = false, vehicule = true, nom = "Surprise 1"},

    }
