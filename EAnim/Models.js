/**
 * @enum {number}
 */
const E_PrestationEtat = {
    PREMIER_CONTACT : 1,
    DEVIS_ENVOYE : 2,
    DEVIS_SIGNE : 4,
    RDV_PRIS : 8,
    CONTRACT_SIGNE : 16,
    CHEQUE_CAUTION_REMIS : 32,
    PRESTATION_PAYE : 64,
    ANNULE : 128
}



/**
 * @template T
 * @typedef {Object} Responce
 * @property {boolean} IsSuccess
 * @property {Array<Message>} Messages
 * @property {T} Datas
 */

/**
 * @typedef {Object} ProtoPrestation
 * @property {number} Id
 * @property {Date} HoraireDebut
 * @property {Date} HoraireFin
 * @property {E_PrestationEtat} Etat
 * @property {string} Notes
 */
