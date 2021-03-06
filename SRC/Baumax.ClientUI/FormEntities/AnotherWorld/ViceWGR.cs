using System;
using System.Collections.Generic;

namespace Baumax.ClientUI.FormEntities.AnotherWorld
{
    public class ViceWGR : ITreeNode
    {
        private int _imageIndex = 2;
        private DateTime _endTime;
        private long _realID;
        private int _parentID;
        private string _name;
        private DateTime _beginTime;
        private int _id;

        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        public int ImageIndex
        {
          get { return _imageIndex; }
          set { _imageIndex = value; }
        }
        public long RealID
        {
          get { return _realID; }
          set { _realID = value; }
        }
        public int ParentID
        {
          get { return _parentID; }
          set { _parentID = value; }
        }
        public string Name
        {
          get { return _name; }
          set { _name = value; }
        }
        public DateTime BeginTime
        {
          get { return _beginTime; }
          set { _beginTime = value; }
        }
        public DateTime EndTime
        {
          get { return _endTime; }
          set { _endTime = value; }
        }

        public ViceWGR (string name, long iD, DateTime begin, DateTime end, long parent)
        {
            _name = name;
            _realID = iD;
            _id = (int)iD;
            _parentID = (int)parent;
            _beginTime = begin;
            _endTime = end;
        }
    }
}