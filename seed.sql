--
-- PostgreSQL database dump
--

\restrict FbyLxTwzEFT6WyoeTuvACCjesWaVhEFcBKKX9U4xTu4CW7QOtXtZa6T6QYkbY8B

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-23 22:57:59 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3892 (class 0 OID 17193)
-- Dependencies: 219
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Dairy
2	Bakery
3	Produce
4	Frozen
5	Beverages
6	Household
\.


--
-- TOC entry 3897 (class 0 OID 17208)
-- Dependencies: 224
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, employee_name, role) FROM stdin;
1	Joey Tribiani	Cashier
2	Phoebe Buffay	Cashier
3	Monica Gellar	Cashier
4	Chandler Bing	Stock Manager
5	Rachel Green	Stock Manager
\.


--
-- TOC entry 3893 (class 0 OID 17196)
-- Dependencies: 220
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, category_id, unit, price, reorder_level) FROM stdin;
1	Milk	1	litre	1.45	10
2	Cheese	1	pack	4.59	8
3	Butter	1	pack	6.67	10
4	Yogurt	1	cup	0.67	15
5	Cream	1	pack	1.67	10
6	Croissant	3	piece	1.23	10
7	Bread	2	loaf	2.59	9
8	Banana Chips	2	pack	8.67	15
9	Muffin	2	Piece	3.67	15
10	Samoosa	1	piece	1.67	10
11	Apples	3	kg	4.23	15
12	Strawberry	3	kg	0.59	15
13	Banana	3	kg	1.67	15
14	Tomatoes	3	kg	3.67	15
15	Carrots	3	kg	5.67	13
16	Pizza	5	piece	4.23	15
17	Ice Cream	3	pack	4.54	8
18	Peas	3	pack	2.67	13
19	French Fries	3	pack	1.67	15
20	Normal Pizza	4	pack	5.67	13
21	Orange Juice	3	litre	4.23	15
22	Mineral Water	3	Bottle	0.59	30
23	Active O2	3	Bottle	1.67	20
24	Red Bull	3	Bottle	3.67	15
25	Coffee	4	pack	5.67	13
26	Tea	3	box	4.23	15
27	Soap	3	pack	1.59	30
28	Laudry Detergent	3	bottle	7.47	15
29	Paper Towels	3	pack	3.67	15
30	Floor Cleaner	3	bottle	5.67	15
\.


--
-- TOC entry 3896 (class 0 OID 17205)
-- Dependencies: 223
-- Data for Name: store_branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_branches (branch_id, branch_name, location) FROM stdin;
1	Hannover Supermarket	Hannover
2	Hamburg Supermarket	Hamburg
\.


--
-- TOC entry 3895 (class 0 OID 17202)
-- Dependencies: 222
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (warehouse_id, warehouse_name, location) FROM stdin;
1	Central Perk	Hannover
2	Gunthers Warehouse	Hamburg
\.


--
-- TOC entry 3898 (class 0 OID 17211)
-- Dependencies: 225
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (inventory_id, product_id, warehouse_id, branch_id, quantity) FROM stdin;
2	2	1	\N	90
3	3	1	\N	100
4	4	2	\N	40
5	11	1	\N	50
6	11	1	\N	80
7	21	1	\N	20
8	1	2	\N	40
9	4	2	\N	100
10	9	2	\N	80
11	12	2	\N	100
12	21	2	\N	20
13	27	2	\N	100
14	1	\N	1	40
15	2	\N	1	100
16	6	\N	1	40
17	3	\N	1	80
18	2	\N	1	32
19	5	\N	1	67
20	1	\N	2	73
21	3	\N	2	49
22	7	\N	2	37
23	12	\N	2	26
24	21	\N	2	19
25	29	\N	2	39
1	1	1	\N	-5
\.


--
-- TOC entry 3894 (class 0 OID 17199)
-- Dependencies: 221
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, supplier_name, email) FROM stdin;
1	Monica Gellar Supplies	monicagellarbing@cleaniness.com
2	Joe Pizza Hut	joetribbiany@pizzahut.com
3	Ross Gellar Essenntial Dino	rossgellar@dino.com
\.


--
-- TOC entry 3899 (class 0 OID 17214)
-- Dependencies: 226
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_orders (purchase_order_id, supplier_id, order_date, status) FROM stdin;
1	1	2026-10-10	Received
2	2	2026-10-12	Received
3	3	2026-10-15	Pending
\.


--
-- TOC entry 3900 (class 0 OID 17217)
-- Dependencies: 227
-- Data for Name: purchase_order_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_order_lines (purchase_order_id, product_id, quantity, unit_cost) FROM stdin;
1	1	100	0.89
1	2	50	1.89
1	11	100	1.50
2	6	60	0.90
2	31	50	1.40
2	23	40	1.59
3	3	30	0.67
3	12	50	1.89
\.


--
-- TOC entry 3902 (class 0 OID 17223)
-- Dependencies: 229
-- Data for Name: sales_transaction_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_transaction_lines (sales_id, product_id, quantity, unit_price) FROM stdin;
1	1	2	1.29
1	6	1	1.59
2	11	3	2.29
2	21	2	2.39
3	2	1	2.49
3	22	4	0.29
4	12	2	1.69
4	26	3	1.29
5	3	1	2.49
5	22	1	6.29
\.


--
-- TOC entry 3901 (class 0 OID 17220)
-- Dependencies: 228
-- Data for Name: sales_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_transactions (sales_id, branch_id, employee_id, sale_data) FROM stdin;
1	1	1	2026-10-16 10:30:00
2	1	2	2026-10-16 11:30:00
3	2	3	2026-10-17 14:20:00
4	2	1	2026-10-17 16:45:00
5	1	3	2026-10-18 09:10:00
\.


-- Completed on 2026-10-23 22:57:59 CEST

--
-- PostgreSQL database dump complete
--

\unrestrict FbyLxTwzEFT6WyoeTuvACCjesWaVhEFcBKKX9U4xTu4CW7QOtXtZa6T6QYkbY8B

