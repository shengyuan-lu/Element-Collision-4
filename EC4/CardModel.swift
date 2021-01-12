//
//  CardModel.swift
//  EC4
//
//  Created by 鲁晟远 on 1/1/19.
//  Copyright © 2019 Shengyuan. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {

        var cardArray = [Card]()
        
        // Acid
        let H2SO4 = Card()
        H2SO4.frontImageName = "H2SO4"
        H2SO4.backImageName = "AcidBack"
        H2SO4.H2SO4 = true
        cardArray.append(H2SO4)
        
        let HCl = Card()
        HCl.frontImageName = "HCL"
        HCl.backImageName = "AcidBack"
        HCl.HCl = true
        cardArray.append(HCl)
        
        let H2CO3 = Card()
        H2CO3.frontImageName = "H2CO3"
        H2CO3.backImageName = "AcidBack"
        H2CO3.H2CO3 = true
        cardArray.append(H2CO3)
        
        let HNO3 = Card()
        HNO3.frontImageName = "HNO3"
        HNO3.backImageName = "AcidBack"
        HNO3.HNO3 = true
        cardArray.append(HNO3)
        
        // Base
        let NaOH = Card()
        NaOH.frontImageName = "NaOH"
        NaOH.backImageName = "BaseBack"
        NaOH.NaOH = true
        cardArray.append(NaOH)
        
        let KOH = Card()
        KOH.frontImageName = "KOH"
        KOH.backImageName = "BaseBack"
        KOH.KOH = true
        cardArray.append(KOH)
        
        let CaOH2 = Card()
        CaOH2.frontImageName = "CaOH2"
        CaOH2.backImageName = "BaseBack"
        CaOH2.CaOH2 = true
        cardArray.append(CaOH2)
        
        let BaOH2 = Card()
        BaOH2.frontImageName = "BaOH2"
        BaOH2.backImageName = "BaseBack"
        BaOH2.BaOH2 = true
        cardArray.append(BaOH2)
        
        let CuOH2 = Card()
        CuOH2.frontImageName = "CuOH2"
        CuOH2.backImageName = "BaseBack"
        CuOH2.CuOH2 = true
        cardArray.append(CuOH2)
        
        let MgOH2 = Card()
        MgOH2.frontImageName = "MgOH2"
        MgOH2.backImageName = "BaseBack"
        MgOH2.MgOH2 = true
        cardArray.append(MgOH2)
        
        let FeOH3 = Card()
        FeOH3.frontImageName = "FeOH3"
        FeOH3.backImageName = "BaseBack"
        FeOH3.FeOH3 = true
        cardArray.append(FeOH3)
        
        let AlOH3 = Card()
        AlOH3.frontImageName = "AlOH3"
        AlOH3.backImageName = "BaseBack"
        AlOH3.AlOH3 = true
        cardArray.append(AlOH3)
        
        // Salt
        let Na2CO3 = Card()
        Na2CO3.frontImageName = "Na2CO3"
        Na2CO3.backImageName = "SaltBack"
        Na2CO3.Na2CO3 = true
        cardArray.append(Na2CO3)
        
        let CaCO3 = Card()
        CaCO3.frontImageName = "Na2CO3"
        CaCO3.backImageName = "SaltBack"
        CaCO3.CaCO3 = true
        cardArray.append(CaCO3)
        
        let CuSO4 = Card()
        CuSO4.frontImageName = "CuSO4"
        CuSO4.backImageName = "SaltBack"
        CuSO4.CuSO4 = true
        cardArray.append(CuSO4)
        
        let CaCl2 = Card()
        CaCl2.frontImageName = "CaCl2"
        CaCl2.backImageName = "SaltBack"
        CaCl2.CaCl2 = true
        cardArray.append(CaCl2)
    
        let Na2SO4 = Card()
        Na2SO4.frontImageName = "Na2SO4"
        Na2SO4.backImageName = "SaltBack"
        Na2SO4.Na2SO4 = true
        cardArray.append(Na2SO4)
        
        let AgNO3 = Card()
        AgNO3.frontImageName = "AgNO3"
        AgNO3.backImageName = "SaltBack"
        AgNO3.AgNO3 = true
        cardArray.append(AgNO3)
        
        let FeSO4 = Card()
        FeSO4.frontImageName = "FeSO4"
        FeSO4.backImageName = "SaltBack"
        FeSO4.FeSO4 = true
        cardArray.append(FeSO4)
        
        // ES
        let Al = Card()
        Al.frontImageName = "Al"
        Al.backImageName = "ESBack"
        Al.Al = true
        cardArray.append(Al)
        
        let Fe = Card()
        Fe.frontImageName = "Fe"
        Fe.backImageName = "ESBack"
        Fe.Fe = true
        cardArray.append(Fe)
        
        let Ca = Card()
        Ca.frontImageName = "Ca"
        Ca.backImageName = "ESBack"
        Ca.Ca = true
        cardArray.append(Ca)
        
        let Mg = Card()
        Mg.frontImageName = "Mg"
        Mg.backImageName = "ESBack"
        Mg.Mg = true
        cardArray.append(Mg)
        
        let Zn = Card()
        Zn.frontImageName = "Zn"
        Zn.backImageName = "ESBack"
        Zn.Zn = true
        cardArray.append(Zn)
        
        let Cu = Card()
        Cu.frontImageName = "Cu"
        Cu.backImageName = "ESBack"
        Cu.Cu = true
        cardArray.append(Cu)
        
        let C = Card()
        C.frontImageName = "C"
        C.backImageName = "ESBack"
        C.C = true
        cardArray.append(C)
        
        let O2 = Card()
        O2.frontImageName = "O2"
        O2.backImageName = "ESBack"
        O2.O2 = true
        cardArray.append(O2)
        
        let H2 = Card()
        H2.frontImageName = "H2"
        H2.backImageName = "ESBack"
        H2.H2 = true
        cardArray.append(H2)
        
        // Oxide
        let CaO = Card()
        CaO.frontImageName = "CaO"
        CaO.backImageName = "OxideBack"
        CaO.CaO = true
        cardArray.append(CaO)
        
        let H2O = Card()
        H2O.frontImageName = "H2O"
        H2O.backImageName = "OxideBack"
        H2O.H2O = true
        cardArray.append(H2O)
        
        let Fe2O3 = Card()
        Fe2O3.frontImageName = "Fe2O3"
        Fe2O3.backImageName = "OxideBack"
        Fe2O3.Fe2O3 = true
        cardArray.append(Fe2O3)
        
        let Al2O3 = Card()
        Al2O3.frontImageName = "Al2O3"
        Al2O3.backImageName = "OxideBack"
        Al2O3.Al2O3 = true
        cardArray.append(Al2O3)
        
        let CuO = Card()
        CuO.frontImageName = "CuO"
        CuO.backImageName = "OxideBack"
        CuO.CuO = true
        cardArray.append(CuO)
        
        let CO = Card()
        CO.frontImageName = "CO"
        CO.backImageName = "OxideBack"
        CO.CO = true
        cardArray.append(CO)
        
        let CO2 = Card()
        CO2.frontImageName = "CO2"
        CO2.backImageName = "OxideBack"
        CO2.CO2 = true
        cardArray.append(CO2)
        
        let SO3 = Card()
        SO3.frontImageName = "SO3"
        SO3.backImageName = "OxideBack"
        SO3.SO3 = true
        cardArray.append(SO3)
        
        return cardArray
        
    } //End of setCards method
    
}
