--
-- PostgreSQL database dump
--

\restrict 0TNmYlbkGBeZExFPJdYm2PFHQWzNbfuBGHQSRoZ3xeSpnyfzEbmX6FiUwccp63g

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-23 22:54:09 CEST

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
-- TOC entry 231 (class 1255 OID 17308)
-- Name: check_quantity(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
if new.quantity <0 then
raise exception 'quantity cannot be negative';
end if;
return new;
end;
$$;


ALTER FUNCTION public.check_quantity() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17193)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(50)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17208)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    employee_name character varying(100),
    role character varying(30)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17211)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    product_id integer,
    warehouse_id integer,
    branch_id integer,
    quantity integer
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17196)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(100),
    category_id integer,
    unit character varying(20),
    price numeric(10,2),
    reorder_level integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17303)
-- Name: inventory_summary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.inventory_summary AS
 SELECT p.product_id,
    p.product_name,
    c.category_name,
    i.warehouse_id,
    i.branch_id,
    i.quantity,
    p.reorder_level
   FROM ((public.products p
     JOIN public.categories c ON ((p.category_id = c.category_id)))
     JOIN public.inventory i ON ((p.product_id = i.product_id)));


ALTER VIEW public.inventory_summary OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17217)
-- Name: purchase_order_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_order_lines (
    purchase_order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    unit_cost numeric(10,2)
);


ALTER TABLE public.purchase_order_lines OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17214)
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_orders (
    purchase_order_id integer NOT NULL,
    supplier_id integer,
    order_date date,
    status character varying(20)
);


ALTER TABLE public.purchase_orders OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17223)
-- Name: sales_transaction_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_transaction_lines (
    sales_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    unit_price numeric(10,2)
);


ALTER TABLE public.sales_transaction_lines OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17220)
-- Name: sales_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_transactions (
    sales_id integer,
    branch_id integer,
    employee_id integer,
    sale_data timestamp without time zone
);


ALTER TABLE public.sales_transactions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17205)
-- Name: store_branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_branches (
    branch_id integer NOT NULL,
    branch_name character varying(100),
    location character varying(100)
);


ALTER TABLE public.store_branches OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17199)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(100),
    email character varying(100)
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17202)
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    warehouse_id integer NOT NULL,
    warehouse_name character varying(100),
    location character varying(100)
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- TOC entry 3715 (class 2606 OID 17228)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3725 (class 2606 OID 17243)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3727 (class 2606 OID 17246)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 3717 (class 2606 OID 17231)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3731 (class 2606 OID 17253)
-- Name: purchase_order_lines purchase_order_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_lines
    ADD CONSTRAINT purchase_order_lines_pkey PRIMARY KEY (purchase_order_id, product_id);


--
-- TOC entry 3729 (class 2606 OID 17249)
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (purchase_order_id);


--
-- TOC entry 3733 (class 2606 OID 17257)
-- Name: sales_transaction_lines sales_transaction_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction_lines
    ADD CONSTRAINT sales_transaction_lines_pkey PRIMARY KEY (sales_id, product_id);


--
-- TOC entry 3723 (class 2606 OID 17240)
-- Name: store_branches store_branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_branches
    ADD CONSTRAINT store_branches_pkey PRIMARY KEY (branch_id);


--
-- TOC entry 3719 (class 2606 OID 17234)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 3721 (class 2606 OID 17237)
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehouse_id);


--
-- TOC entry 3743 (class 2620 OID 17309)
-- Name: inventory check_quantity_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER check_quantity_trigger BEFORE INSERT ON public.inventory FOR EACH ROW EXECUTE FUNCTION public.check_quantity();


--
-- TOC entry 3735 (class 2606 OID 17273)
-- Name: inventory inventory_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.store_branches(branch_id);


--
-- TOC entry 3736 (class 2606 OID 17263)
-- Name: inventory inventory_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 3737 (class 2606 OID 17268)
-- Name: inventory inventory_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(warehouse_id);


--
-- TOC entry 3734 (class 2606 OID 17258)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- TOC entry 3739 (class 2606 OID 17283)
-- Name: purchase_order_lines purchase_order_lines_purchase_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_lines
    ADD CONSTRAINT purchase_order_lines_purchase_order_id_fkey FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(purchase_order_id);


--
-- TOC entry 3738 (class 2606 OID 17278)
-- Name: purchase_orders purchase_orders_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);


--
-- TOC entry 3742 (class 2606 OID 17298)
-- Name: sales_transaction_lines sales_transaction_lines_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction_lines
    ADD CONSTRAINT sales_transaction_lines_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 3740 (class 2606 OID 17288)
-- Name: sales_transactions sales_transactions_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transactions
    ADD CONSTRAINT sales_transactions_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.store_branches(branch_id);


--
-- TOC entry 3741 (class 2606 OID 17293)
-- Name: sales_transactions sales_transactions_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transactions
    ADD CONSTRAINT sales_transactions_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


-- Completed on 2026-10-23 22:54:09 CEST

--
-- PostgreSQL database dump complete
--

\unrestrict 0TNmYlbkGBeZExFPJdYm2PFHQWzNbfuBGHQSRoZ3xeSpnyfzEbmX6FiUwccp63g

