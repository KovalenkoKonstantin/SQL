drop table if exists Overheads_Dependencies;

create table Overheads_Dependencies
(
    [1C_article_id]                                int
        constraint FK_Overheads_Dependencies_1C_article_id
            references Names_of_Articles_in_1C,
    overhead_items_id                              int
        constraint FK_Overheads_Dependencies_overhead_items_id
            references FAS_Overhead_Items,
    general_expenses_id                            int
        constraint FK_Overheads_Dependencies_general_expenses_id
            references Other_General_Expenses,
    pm_overhead_items_id                           int
        constraint FK_Overheads_Dependencies_pm_overhead_items_id
            references Overhead_Items_of_JSC_PM,
    indicator_of_inclusion_of_articles_44_accounts bit
)
go

insert into Overheads_Dependencies([1C_article_id], overhead_items_id, general_expenses_id, pm_overhead_items_id,
                                   indicator_of_inclusion_of_articles_44_accounts)
values (2, 7, 19, Null, 1),
       (5, 1, Null, 5, 0),
       (4, 1, Null, 5, 0),
       (6, 1, Null, 5, 0),
       (3, 7, 1, Null, 0),
       (8, 2, Null, Null, 0),
       (9, 2, Null, 1, 0),
       (7, 2, Null, Null, 0),
       (77, 2, Null, Null, 0),
       (10, 2, Null, Null, 0),
       (12, 7, 6, 5, 0),
       (13, 7, 6, 5, 0),
       (14, 7, 26, Null, 0),
       (220, 7, 26, Null, 0),
       (11, 7, 3, 2, 0),
       (15, 7, 3, Null, 0),
       (221, 7, 3, Null, 0),
       (16, 6, Null, 5, 0),
       (18, 7, 12, 5, 0),
       (17, 7, 12, 5, 0),
       (19, 7, 26, Null, 0),
       (20, 7, 19, Null, 1),
       (21, 7, 19, Null, 0),
       (22, 7, 19, Null, 0),
       (23, 10, Null, Null, 0),
       (24, 7, 19, 5, 1),
       (25, 7, 19, Null, 0),
       (222, 7, 19, Null, 0),
       (26, 7, 14, 5, 0),
       (260, 7, 14, 5, 0),
       (27, 7, 26, 7, 0),
       (28, 7, 14, Null, 0),
       (29, 7, 14, Null, 0),
       (30, 3, Null, Null, 0),
       (31, 3, Null, Null, 0),
       (34, 3, Null, Null, 0),
       (32, 3, Null, 3, 0),
       (33, 3, Null, Null, 0),
       (35, 3, Null, Null, 0),
       (36, 7, 14, Null, 0),
       (223, 7, 14, Null, 0),
       (37, 7, 14, Null, 0),
       (38, 7, 4, Null, 0),
       (224, 7, 4, Null, 0),
       (39, 4, Null, Null, 1),
       (40, 7, 22, Null, 0),
       (41, 7, 5, 5, 1),
       (42, 5, Null, 5, 1),
       (51, 5, Null, Null, 0),
       (43, 5, Null, 5, 1),
       (44, 5, Null, 5, 1),
       (46, 5, Null, Null, 1),
       (47, 5, Null, Null, 1),
       (48, 5, Null, Null, 1),
       (49, 5, Null, 5, 1),
       (45, 5, Null, 5, 1),
       (50, 5, Null, 5, 1),
       (225, 5, Null, 5, 1),
       (226, 5, Null, 5, 1),
       (227, 5, Null, 5, 1),
       (228, 5, Null, 5, 1),
       (229, 5, Null, 5, 1),
       (230, 5, Null, 5, 1),
       (52, 7, 3, 2, 0),
       (53, 7, 3, 2, 0),
       (54, 7, 14, Null, 0),
       (55, 7, 19, Null, 0),
       (56, 7, 6, Null, 0),
       (57, 7, 6, Null, 0),
       (58, 7, 7, 5, 0),
       (59, 7, 8, 5, 0),
       (62, 7, 8, 5, 0),
       (60, 7, 8, 5, 0),
       (61, 7, 8, 5, 0),
       (63, 7, 8, Null, 0),
       (64, 7, 9, Null, 0),
       (65, 7, 9, Null, 0),
       (66, 7, 9, Null, 0),
       (67, 7, 9, Null, 0),
       (68, 7, 9, Null, 0),
       (69, 7, 14, Null, 0),
       (70, 7, 14, Null, 0),
       (71, 7, 14, 5, 0),
       (72, 7, 14, 5, 0),
       (231, 7, 14, 5, 0),
       (73, 7, 14, 5, 0),
       (74, 7, 14, 5, 0),
       (75, 7, 19, Null, 0),
       (76, 7, 10, Null, 0),
       (78, 7, 11, Null, 0),
       (79, 7, 20, Null, 0),
       (80, 7, 12, 5, 0),
       (82, 7, 12, 5, 0),
       (81, 7, 12, 5, 0),
       (83, 7, 12, 5, 0),
       (84, 7, 13, Null, 0),
       (85, 7, 13, Null, 0),
       (87, 4, Null, Null, 0),
       (89, 4, Null, 5, 1),
       (86, 4, Null, Null, 0),
       (88, 4, Null, 5, 1),
       (232, 4, Null, 5, 1),
       (90, 7, 19, Null, 0),
       (91, 7, 14, 6, 0),
       (92, 7, 14, 6, 0),
       (93, 7, 14, 6, 0),
       (94, 9, Null, Null, 0),
       (233, 9, Null, Null, 0),
       (96, 7, 15, Null, 0),
       (95, 7, 15, Null, 0),
       (97, 7, 16, Null, 1),
       (98, 7, 16, Null, 1),
       (99, 7, 16, Null, 1),
       (100, 7, 19, Null, 0),
       (101, 7, 19, Null, 0),
       (234, 7, 19, Null, 0),
       (102, 3, Null, 3, 0),
       (103, 3, Null, 3, 0),
       (104, 10, Null, 4, 0),
       (108, 7, 19, Null, 0),
       (105, 7, 2, 5, 1),
       (106, 7, 2, 5, 1),
       (107, 7, 2, 5, 0),
       (109, 7, 14, Null, 0),
       (110, 7, 14, Null, 0),
       (111, 7, 19, Null, 0),
       (113, 4, Null, Null, 0),
       (112, 4, Null, Null, 0),
       (114, 7, 19, Null, 0),
       (115, 7, 12, Null, 1),
       (116, 7, 12, Null, 1),
       (117, 7, 17, Null, 0),
       (118, 7, 17, Null, 0),
       (120, 7, 17, Null, 0),
       (119, 7, 17, Null, 0),
       (122, 7, 14, 5, 0),
       (123, 7, 14, 5, 0),
       (121, 7, 14, 5, 0),
       (124, 7, 2, 5, 1),
       (235, 7, 2, 5, 1),
       (126, 7, 17, Null, 0),
       (125, 7, 17, Null, 0),
       (128, 7, 17, Null, 0),
       (127, 7, 17, Null, 0),
       (129, 7, 17, 5, 0),
       (130, 7, 17, 5, 0),
       (132, 7, 17, Null, 0),
       (131, 7, 17, Null, 0),
       (134, 7, 17, Null, 1),
       (133, 7, 17, Null, 1),
       (135, 7, 7, 5, 0),
       (236, 7, 7, 5, 0),
       (136, 7, 22, Null, 0),
       (138, 7, 18, Null, 1),
       (139, 7, 18, Null, 1),
       (137, 7, 18, Null, 1),
       (140, 7, 18, Null, 1),
       (143, 7, 18, 5, 0),
       (144, 7, 18, 5, 0),
       (141, 7, 18, 5, 0),
       (142, 7, 18, 5, 0),
       (146, 7, 19, 5, 0),
       (147, 7, 19, 5, 0),
       (145, 7, 19, 5, 0),
       (148, 7, 19, 5, 0),
       (149, 7, 8, Null, 0),
       (150, 7, 14, Null, 0),
       (237, 7, 14, Null, 0),
       (151, 7, 19, 5, 0),
       (152, 7, 19, 5, 1),
       (153, 7, 19, Null, 1),
       (238, 7, 19, Null, 1),
       (154, 7, 19, 5, 0),
       (155, 7, 19, Null, 0),
       (239, 7, 19, Null, 0),
       (157, 7, 14, 5, 0),
       (158, 7, 14, 5, 0),
       (241, 7, 14, 5, 0),
       (156, 7, 14, 6, 0),
       (240, 7, 14, 6, 0),
       (159, 7, 14, 6, 0),
       (160, 7, 22, Null, 0),
       (242, 7, 22, Null, 0),
       (161, 7, 19, Null, 0),
       (163, 7, 12, 5, 0),
       (162, 7, 12, 5, 0),
       (164, 7, 19, 5, 0),
       (165, 7, 19, 5, 0),
       (166, 7, 19, 5, 0),
       (167, 7, 19, 5, 0),
       (168, 7, 19, 5, 0),
       (169, 7, 19, Null, 0),
       (170, 8, Null, Null, 1),
       (243, 8, Null, Null, 1),
       (171, 8, Null, Null, 0),
       (172, 8, Null, Null, 0),
       (244, 8, Null, Null, 0),
       (173, 7, 19, 5, 0),
       (178, 7, 26, Null, 0),
       (181, 7, 26, 7, 0),
       (174, 7, 26, 7, 0),
       (245, 7, 26, 7, 0),
       (175, 7, 26, Null, 0),
       (246, 7, 26, Null, 0),
       (176, 7, 26, Null, 0),
       (247, 7, 26, Null, 0),
       (177, 7, 26, Null, 0),
       (248, 7, 26, Null, 0),
       (179, 7, 26, Null, 0),
       (249, 7, 26, Null, 0),
       (180, 7, 26, Null, 0),
       (250, 7, 26, Null, 0),
       (182, 7, 26, 7, 0),
       (251, 7, 26, 7, 0),
       (183, 7, 26, 7, 1),
       (252, 7, 26, 7, 1),
       (184, 7, 21, Null, 1),
       (185, 7, 21, 5, 1),
       (253, 7, 21, 5, 1),
       (186, 7, 21, Null, 1),
       (187, 7, 21, Null, 1),
       (254, 7, 21, Null, 1),
       (188, 7, 21, Null, 1),
       (189, 7, 21, Null, 1),
       (255, 7, 21, Null, 1),
       (191, 7, 14, Null, 0),
       (190, 7, 14, Null, 0),
       (192, 7, 23, Null, 0),
       (193, 7, 19, Null, 0),
       (256, 7, 19, Null, 0),
       (194, 7, 19, Null, 1),
       (195, 7, 24, Null, 0),
       (196, 7, 24, Null, 0),
       (198, 7, 24, Null, 1),
       (197, 7, 24, Null, 1),
       (200, 7, 24, 5, 1),
       (201, 7, 24, Null, 1),
       (199, 7, 24, 5, 0),
       (202, 10, Null, Null, 0),
       (203, 10, Null, Null, 0),
       (204, 10, Null, Null, 0),
       (205, 7, 17, Null, 0),
       (257, 7, 17, Null, 0),
       (206, 7, 19, Null, 0),
       (207, 7, 19, Null, 0),
       (258, 7, 19, Null, 0),
       (208, 6, Null, 5, 0),
       (209, 6, Null, 5, 0),
       (211, 7, 25, Null, 1),
       (210, 7, 25, Null, 1),
       (212, 7, 14, 6, 0),
       (259, 7, 14, 6, 0),
       (213, 7, 19, Null, 0),
       (214, 7, 19, Null, 0),
       (215, 7, 19, Null, 0),
       (216, 7, 19, Null, 0),
       (217, 7, 19, Null, 0),
       (218, 7, 19, 5, 0),
       (219, 7, 19, Null, 0),
       (262, 7, 12, Null, 0),
       (261, 7, 12, Null, 0),
       (1, 7, 19, Null, 0);


select *
from Overheads_Dependencies;

select [1C_article_name],
       overhead_items_name,
       general_expenses_name,
       pm_overhead_items_name,
       indicator_of_inclusion_of_articles_44_accounts
from Overheads_Dependencies
         inner join FAS_Overhead_Items FOI on Overheads_Dependencies.overhead_items_id = FOI.overhead_items_id
         inner join Other_General_Expenses OGE on Overheads_Dependencies.general_expenses_id = OGE.general_expenses_id
         inner join Overhead_Items_of_JSC_PM OIoJP
                    on Overheads_Dependencies.pm_overhead_items_id = OIoJP.pm_overhead_items_id
         inner join Names_of_Articles_in_1C NoAi1C on Overheads_Dependencies.[1C_article_id] = NoAi1C.[1C_article_id]

drop procedure if exists GetOverheadsDependencies;

create procedure GetOverheadsDependencies as
    begin
    select [1C_article_name],
       overhead_items_name,
       general_expenses_name,
       pm_overhead_items_name,
       indicator_of_inclusion_of_articles_44_accounts
from Overheads_Dependencies
         inner join FAS_Overhead_Items FOI on Overheads_Dependencies.overhead_items_id = FOI.overhead_items_id
         inner join Other_General_Expenses OGE on Overheads_Dependencies.general_expenses_id = OGE.general_expenses_id
         inner join Overhead_Items_of_JSC_PM OIoJP
                    on Overheads_Dependencies.pm_overhead_items_id = OIoJP.pm_overhead_items_id
         inner join Names_of_Articles_in_1C NoAi1C on Overheads_Dependencies.[1C_article_id] = NoAi1C.[1C_article_id]
end

execute GetOverheadsDependencies;