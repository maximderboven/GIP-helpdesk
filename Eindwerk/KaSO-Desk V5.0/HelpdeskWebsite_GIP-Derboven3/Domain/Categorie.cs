using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Categorie
    {
        private int _id;
        private string _categorie;

        public Categorie(int pID, string pCategorie)
        {
            _id = pID;
            _categorie = pCategorie;
        }

        public int Id { get => _id; set => _id = value; }
        public string categorie { get => _categorie; set => _categorie = value; }
    }
}
