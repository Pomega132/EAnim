
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/28/2022 16:32:10
-- Generated from EDMX file: C:\Users\Steven\source\repos\Pomega132\EAnim\EAnim\Models\Datas.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [db_a87999_admin];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Prestation'
CREATE TABLE [dbo].[Prestation] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [HoraireDebut] datetime  NULL,
    [HoraireFin] datetime  NULL,
    [Etat] int  NOT NULL,
    [Notes] nvarchar(max)  NULL,
    [Lieu_Id] int  NULL,
    [TypePrestation_Id] int  NOT NULL
);
GO

-- Creating table 'TypePrestation'
CREATE TABLE [dbo].[TypePrestation] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Contact'
CREATE TABLE [dbo].[Contact] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NOT NULL,
    [Prenom] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NULL,
    [Tel] nvarchar(max)  NULL
);
GO

-- Creating table 'Lieu'
CREATE TABLE [dbo].[Lieu] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NOT NULL,
    [Adresse1] nvarchar(max)  NULL,
    [Adresse2] nvarchar(max)  NULL,
    [Ville] nvarchar(max)  NULL,
    [Zip] nvarchar(max)  NULL,
    [URL] nvarchar(max)  NULL
);
GO

-- Creating table 'Devis'
CREATE TABLE [dbo].[Devis] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [PrestationDevis_Id] int  NOT NULL
);
GO

-- Creating table 'Article'
CREATE TABLE [dbo].[Article] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Ref] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Nom] nvarchar(max)  NOT NULL,
    [PrixUnitaire] nvarchar(max)  NOT NULL,
    [Unite_Id] int  NULL
);
GO

-- Creating table 'Unite'
CREATE TABLE [dbo].[Unite] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DevisArticle'
CREATE TABLE [dbo].[DevisArticle] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Quantite] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [PrixUnitaire] nvarchar(max)  NOT NULL,
    [Unite_Id] int  NULL,
    [Article_Id] int  NOT NULL
);
GO

-- Creating table 'Contact_Prestataire'
CREATE TABLE [dbo].[Contact_Prestataire] (
    [Siret] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Contact_PrestationContact'
CREATE TABLE [dbo].[Contact_PrestationContact] (
    [Type] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL,
    [Prestation_Id] int  NOT NULL
);
GO

-- Creating table 'Contact_Client'
CREATE TABLE [dbo].[Contact_Client] (
    [Adresse1] nvarchar(max)  NULL,
    [Adresse2] nvarchar(max)  NULL,
    [Ville] nvarchar(max)  NULL,
    [Zip] nvarchar(max)  NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Devis_Facture'
CREATE TABLE [dbo].[Devis_Facture] (
    [Id] int  NOT NULL,
    [PrestationFacture_Id] int  NOT NULL
);
GO

-- Creating table 'PrestationPrestataire'
CREATE TABLE [dbo].[PrestationPrestataire] (
    [Prestations_Id] int  NOT NULL,
    [Prestataires_Id] int  NOT NULL
);
GO

-- Creating table 'LieuContact'
CREATE TABLE [dbo].[LieuContact] (
    [Lieux_Id] int  NOT NULL,
    [Contacts_Id] int  NOT NULL
);
GO

-- Creating table 'PrestationClient'
CREATE TABLE [dbo].[PrestationClient] (
    [Prestations_Id] int  NOT NULL,
    [Clients_Id] int  NOT NULL
);
GO

-- Creating table 'DevisArticleDevis'
CREATE TABLE [dbo].[DevisArticleDevis] (
    [DevisArticles_Id] int  NOT NULL,
    [Devis_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Prestation'
ALTER TABLE [dbo].[Prestation]
ADD CONSTRAINT [PK_Prestation]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypePrestation'
ALTER TABLE [dbo].[TypePrestation]
ADD CONSTRAINT [PK_TypePrestation]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contact'
ALTER TABLE [dbo].[Contact]
ADD CONSTRAINT [PK_Contact]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Lieu'
ALTER TABLE [dbo].[Lieu]
ADD CONSTRAINT [PK_Lieu]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Devis'
ALTER TABLE [dbo].[Devis]
ADD CONSTRAINT [PK_Devis]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Article'
ALTER TABLE [dbo].[Article]
ADD CONSTRAINT [PK_Article]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Unite'
ALTER TABLE [dbo].[Unite]
ADD CONSTRAINT [PK_Unite]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DevisArticle'
ALTER TABLE [dbo].[DevisArticle]
ADD CONSTRAINT [PK_DevisArticle]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contact_Prestataire'
ALTER TABLE [dbo].[Contact_Prestataire]
ADD CONSTRAINT [PK_Contact_Prestataire]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contact_PrestationContact'
ALTER TABLE [dbo].[Contact_PrestationContact]
ADD CONSTRAINT [PK_Contact_PrestationContact]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contact_Client'
ALTER TABLE [dbo].[Contact_Client]
ADD CONSTRAINT [PK_Contact_Client]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Devis_Facture'
ALTER TABLE [dbo].[Devis_Facture]
ADD CONSTRAINT [PK_Devis_Facture]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Prestations_Id], [Prestataires_Id] in table 'PrestationPrestataire'
ALTER TABLE [dbo].[PrestationPrestataire]
ADD CONSTRAINT [PK_PrestationPrestataire]
    PRIMARY KEY CLUSTERED ([Prestations_Id], [Prestataires_Id] ASC);
GO

-- Creating primary key on [Lieux_Id], [Contacts_Id] in table 'LieuContact'
ALTER TABLE [dbo].[LieuContact]
ADD CONSTRAINT [PK_LieuContact]
    PRIMARY KEY CLUSTERED ([Lieux_Id], [Contacts_Id] ASC);
GO

-- Creating primary key on [Prestations_Id], [Clients_Id] in table 'PrestationClient'
ALTER TABLE [dbo].[PrestationClient]
ADD CONSTRAINT [PK_PrestationClient]
    PRIMARY KEY CLUSTERED ([Prestations_Id], [Clients_Id] ASC);
GO

-- Creating primary key on [DevisArticles_Id], [Devis_Id] in table 'DevisArticleDevis'
ALTER TABLE [dbo].[DevisArticleDevis]
ADD CONSTRAINT [PK_DevisArticleDevis]
    PRIMARY KEY CLUSTERED ([DevisArticles_Id], [Devis_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Prestations_Id] in table 'PrestationPrestataire'
ALTER TABLE [dbo].[PrestationPrestataire]
ADD CONSTRAINT [FK_PrestationPrestataire_Prestation]
    FOREIGN KEY ([Prestations_Id])
    REFERENCES [dbo].[Prestation]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Prestataires_Id] in table 'PrestationPrestataire'
ALTER TABLE [dbo].[PrestationPrestataire]
ADD CONSTRAINT [FK_PrestationPrestataire_Prestataire]
    FOREIGN KEY ([Prestataires_Id])
    REFERENCES [dbo].[Contact_Prestataire]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestationPrestataire_Prestataire'
CREATE INDEX [IX_FK_PrestationPrestataire_Prestataire]
ON [dbo].[PrestationPrestataire]
    ([Prestataires_Id]);
GO

-- Creating foreign key on [Prestation_Id] in table 'Contact_PrestationContact'
ALTER TABLE [dbo].[Contact_PrestationContact]
ADD CONSTRAINT [FK_PrestationPrestationContact]
    FOREIGN KEY ([Prestation_Id])
    REFERENCES [dbo].[Prestation]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestationPrestationContact'
CREATE INDEX [IX_FK_PrestationPrestationContact]
ON [dbo].[Contact_PrestationContact]
    ([Prestation_Id]);
GO

-- Creating foreign key on [Lieu_Id] in table 'Prestation'
ALTER TABLE [dbo].[Prestation]
ADD CONSTRAINT [FK_LieuPrestation]
    FOREIGN KEY ([Lieu_Id])
    REFERENCES [dbo].[Lieu]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LieuPrestation'
CREATE INDEX [IX_FK_LieuPrestation]
ON [dbo].[Prestation]
    ([Lieu_Id]);
GO

-- Creating foreign key on [Lieux_Id] in table 'LieuContact'
ALTER TABLE [dbo].[LieuContact]
ADD CONSTRAINT [FK_LieuContact_Lieu]
    FOREIGN KEY ([Lieux_Id])
    REFERENCES [dbo].[Lieu]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Contacts_Id] in table 'LieuContact'
ALTER TABLE [dbo].[LieuContact]
ADD CONSTRAINT [FK_LieuContact_Contact]
    FOREIGN KEY ([Contacts_Id])
    REFERENCES [dbo].[Contact]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LieuContact_Contact'
CREATE INDEX [IX_FK_LieuContact_Contact]
ON [dbo].[LieuContact]
    ([Contacts_Id]);
GO

-- Creating foreign key on [TypePrestation_Id] in table 'Prestation'
ALTER TABLE [dbo].[Prestation]
ADD CONSTRAINT [FK_TypePrestationPrestation]
    FOREIGN KEY ([TypePrestation_Id])
    REFERENCES [dbo].[TypePrestation]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TypePrestationPrestation'
CREATE INDEX [IX_FK_TypePrestationPrestation]
ON [dbo].[Prestation]
    ([TypePrestation_Id]);
GO

-- Creating foreign key on [Prestations_Id] in table 'PrestationClient'
ALTER TABLE [dbo].[PrestationClient]
ADD CONSTRAINT [FK_PrestationClient_Prestation]
    FOREIGN KEY ([Prestations_Id])
    REFERENCES [dbo].[Prestation]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Clients_Id] in table 'PrestationClient'
ALTER TABLE [dbo].[PrestationClient]
ADD CONSTRAINT [FK_PrestationClient_Client]
    FOREIGN KEY ([Clients_Id])
    REFERENCES [dbo].[Contact_Client]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestationClient_Client'
CREATE INDEX [IX_FK_PrestationClient_Client]
ON [dbo].[PrestationClient]
    ([Clients_Id]);
GO

-- Creating foreign key on [PrestationDevis_Id] in table 'Devis'
ALTER TABLE [dbo].[Devis]
ADD CONSTRAINT [FK_PrestationDevis]
    FOREIGN KEY ([PrestationDevis_Id])
    REFERENCES [dbo].[Prestation]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestationDevis'
CREATE INDEX [IX_FK_PrestationDevis]
ON [dbo].[Devis]
    ([PrestationDevis_Id]);
GO

-- Creating foreign key on [PrestationFacture_Id] in table 'Devis_Facture'
ALTER TABLE [dbo].[Devis_Facture]
ADD CONSTRAINT [FK_PrestationFacture]
    FOREIGN KEY ([PrestationFacture_Id])
    REFERENCES [dbo].[Prestation]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestationFacture'
CREATE INDEX [IX_FK_PrestationFacture]
ON [dbo].[Devis_Facture]
    ([PrestationFacture_Id]);
GO

-- Creating foreign key on [Unite_Id] in table 'DevisArticle'
ALTER TABLE [dbo].[DevisArticle]
ADD CONSTRAINT [FK_UniteDevisArticle]
    FOREIGN KEY ([Unite_Id])
    REFERENCES [dbo].[Unite]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UniteDevisArticle'
CREATE INDEX [IX_FK_UniteDevisArticle]
ON [dbo].[DevisArticle]
    ([Unite_Id]);
GO

-- Creating foreign key on [Unite_Id] in table 'Article'
ALTER TABLE [dbo].[Article]
ADD CONSTRAINT [FK_UniteArticle]
    FOREIGN KEY ([Unite_Id])
    REFERENCES [dbo].[Unite]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UniteArticle'
CREATE INDEX [IX_FK_UniteArticle]
ON [dbo].[Article]
    ([Unite_Id]);
GO

-- Creating foreign key on [DevisArticles_Id] in table 'DevisArticleDevis'
ALTER TABLE [dbo].[DevisArticleDevis]
ADD CONSTRAINT [FK_DevisArticleDevis_DevisArticle]
    FOREIGN KEY ([DevisArticles_Id])
    REFERENCES [dbo].[DevisArticle]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Devis_Id] in table 'DevisArticleDevis'
ALTER TABLE [dbo].[DevisArticleDevis]
ADD CONSTRAINT [FK_DevisArticleDevis_Devis]
    FOREIGN KEY ([Devis_Id])
    REFERENCES [dbo].[Devis]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DevisArticleDevis_Devis'
CREATE INDEX [IX_FK_DevisArticleDevis_Devis]
ON [dbo].[DevisArticleDevis]
    ([Devis_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'DevisArticle'
ALTER TABLE [dbo].[DevisArticle]
ADD CONSTRAINT [FK_ArticleDevisArticle]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Article]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleDevisArticle'
CREATE INDEX [IX_FK_ArticleDevisArticle]
ON [dbo].[DevisArticle]
    ([Article_Id]);
GO

-- Creating foreign key on [Id] in table 'Contact_Prestataire'
ALTER TABLE [dbo].[Contact_Prestataire]
ADD CONSTRAINT [FK_Prestataire_inherits_Contact]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Contact]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Contact_PrestationContact'
ALTER TABLE [dbo].[Contact_PrestationContact]
ADD CONSTRAINT [FK_PrestationContact_inherits_Contact]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Contact]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Contact_Client'
ALTER TABLE [dbo].[Contact_Client]
ADD CONSTRAINT [FK_Client_inherits_Contact]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Contact]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Devis_Facture'
ALTER TABLE [dbo].[Devis_Facture]
ADD CONSTRAINT [FK_Facture_inherits_Devis]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Devis]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------