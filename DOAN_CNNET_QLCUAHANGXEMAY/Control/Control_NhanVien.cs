﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
namespace DOAN_CNNET_QLCUAHANGXEMAY
{
    class Control_NhanVien
    {
        ConnSQL connect = new ConnSQL();
        DataSet ds;
        SqlDataAdapter da;
        DataTable dt;
        SqlCommandBuilder cB;

        public DataTable select(string table)
        {
            ds = new DataSet();
            string stringselectX = "select * from " + table;
            SqlCommand cmd = new SqlCommand(stringselectX, connect.KetNoiCSDL());
            da = new SqlDataAdapter(cmd);
            da.Fill(ds, table);
            dt = ds.Tables[table];
            return dt;
        }

        public int checkTrungMa(string ma, string table)
        {
            DataRow drCheck = ds.Tables[table].Rows.Find(ma);
            if (drCheck != null)
            {
                return 1;
            }
            return 0;
        }


        public void insert(Model_NhanVien x, string table)
        {
            DataRow dr = ds.Tables[table].NewRow();
            dr[0] = x.maNV;
            dr[1] = x.tenNV;
            dr[2] = x.gioiTinh;
            dr[3] = x.sdt;
            dr[4] = x.diaChi;
            dr[5] = x.chucVu;
            dr[6] = x.matKhau;
            ds.Tables[table].Rows.Add(dr);
            cB = new SqlCommandBuilder(da);
            da.Update(ds, table);
        }

        public void update(Model_NhanVien x, string table)
        {
            DataRow dr = ds.Tables[table].Rows.Find(x.maNV);
            if (dr != null)
            {
                dr[1] = x.tenNV;
                dr[2] = x.gioiTinh;
                dr[3] = x.sdt;
                dr[4] = x.diaChi;
                dr[5] = x.chucVu;
                dr[6] = x.matKhau;
            }
            SqlCommandBuilder cB = new SqlCommandBuilder(da);
            da.Update(ds, table);
        }

        public void delete(Model_NhanVien x, string table)
        {
            DataRow dr = ds.Tables[table].Rows.Find(x.maNV);
            if (dr != null)
            {
                dr.Delete();
            }
            SqlCommandBuilder cB = new SqlCommandBuilder(da);
            da.Update(ds, table);
        }
    }
}