using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Melding
    {
        private int _id;
        private string _omschrijving;
        private DateTime _dtmGemaakt;
        private string _url;

        public Melding() { }

        public Melding(int pID, string pOmschrijving, DateTime pdtmGemaakt, string pUrl)
        {
            _id = pID;
            _omschrijving = pOmschrijving;
            _dtmGemaakt = pdtmGemaakt;
            _url = pUrl;
        }

        public int Id { get => _id; set => _id = value; }
        public string Omschrijving { get => _omschrijving; set => _omschrijving = value; }
        public DateTime DtmGemaakt { get => _dtmGemaakt; set => _dtmGemaakt = value; }
        public string Url { get => _url; set => _url = value; }

        public override string ToString()
        {
            return Omschrijving + " op " + DtmGemaakt; 
        }
    }
}
