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

        //Constructor
        public Categorie(int pid, string pcategorie)
        {
            _id = pid;
            _categorie = pcategorie;
        }

        public int Id { get => _id; set => _id = value; }
        public string categorie { get => _categorie; set => _categorie = value; }
    }
}
