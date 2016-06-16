CREATE TABLE [artist]( [id] int IDENTITY(1,1) NOT NULL, [name] varchar( 250 ) NOT NULL, CONSTRAINT [artist_pk] PRIMARY KEY( [id] ), CONSTRAINT [artist_name] UNIQUE( [name] ) )

CREATE TABLE [cd]( [id] int IDENTITY(100,1) NOT NULL, [artistid] int NOT NULL, [title] varchar( 250 ) NOT NULL, [year] datetime NULL, CONSTRAINT [cd_pk] PRIMARY KEY( [id] ), CONSTRAINT [cd_title_artistid] UNIQUE( [title], [artistid] ) )

CREATE INDEX [cd_idx_artistid] 
    ON [cd]( [artistid] )

CREATE TABLE [track]( [id] int IDENTITY(200,1) NOT NULL, [cdid] int NOT NULL, [title] varchar( 250 ) NOT NULL, CONSTRAINT [track_pk] PRIMARY KEY( [id] ), CONSTRAINT [track_title_cdid] UNIQUE( [title], [cdid] ) )

CREATE INDEX [track_idx_cdid] 
    ON [track]( [cdid] )
ALTER TABLE [cd] ADD CONSTRAINT [cd_fk_artistid] FOREIGN KEY( [artistid] ) REFERENCES [artist]( [id] ) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
ALTER TABLE [track] ADD CONSTRAINT [track_fk_cdid] FOREIGN KEY( [cdid] ) REFERENCES [cd]( [id] ) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE;
