using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Status
    {
        private int _id;
        private string _status;

        public Status(int pID, string pStatus)
        {
            _id = pID;
            _status = pStatus;
        }

        public int Id { get => _id; set => _id = value; }
        public string status { get => _status; set => _status = value; }
    }
}
