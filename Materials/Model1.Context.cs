//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Materials
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MaterialsEntities : DbContext
    {
        public MaterialsEntities()
            : base("name=MaterialsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AgentPriorityHistory> AgentPriorityHistory { get; set; }
        public virtual DbSet<Agents> Agents { get; set; }
        public virtual DbSet<AgentType> AgentType { get; set; }
        public virtual DbSet<Material> Material { get; set; }
        public virtual DbSet<MaterialCountHistory> MaterialCountHistory { get; set; }
        public virtual DbSet<MaterialSuplier> MaterialSuplier { get; set; }
        public virtual DbSet<MaterialType> MaterialType { get; set; }
        public virtual DbSet<Supplier> Supplier { get; set; }
    }
}
