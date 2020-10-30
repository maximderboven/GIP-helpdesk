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

        //Constructor
        public Status(int pid, string pstatus)
        {
            _id = pid;
            _status = pstatus;
        }

        public int Id { get => _id; set => _id = value; }
        public string status { get => _status; set => _status = value; }
    }
}
