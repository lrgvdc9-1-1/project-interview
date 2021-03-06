PGDMP     3    2                x            store    12.2    12.0     N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Q           1262    16393    store    DATABASE     c   CREATE DATABASE store WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE store;
                postgres    false                        2615    16394    info    SCHEMA        CREATE SCHEMA info;
    DROP SCHEMA info;
                postgres    false            �            1259    16397 	   customers    TABLE     �   CREATE TABLE info.customers (
    customerid bigint NOT NULL,
    first_name text,
    middle_name text,
    last_name text,
    dob date,
    address text,
    email text,
    date_registered date NOT NULL
);
    DROP TABLE info.customers;
       info         heap    postgres    false    6            R           0    0    TABLE customers    COMMENT     `   COMMENT ON TABLE info.customers IS 'This holds all the customer''s information for this store';
          info          postgres    false    204            �            1259    16395    customers_customerID_seq    SEQUENCE     �   CREATE SEQUENCE info."customers_customerID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE info."customers_customerID_seq";
       info          postgres    false    6    204            S           0    0    customers_customerID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE info."customers_customerID_seq" OWNED BY info.customers.customerid;
          info          postgres    false    203            �            1259    16410    orders    TABLE     �   CREATE TABLE info.orders (
    orderid bigint NOT NULL,
    customerid bigint NOT NULL,
    order_total bigint,
    order_date date,
    order_name text
);
    DROP TABLE info.orders;
       info         heap    postgres    false    6            T           0    0    TABLE orders    COMMENT     ^   COMMENT ON TABLE info.orders IS 'This table holds all the orders for a particular customer.';
          info          postgres    false    207            �            1259    16408    orders_customerID_seq    SEQUENCE     ~   CREATE SEQUENCE info."orders_customerID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE info."orders_customerID_seq";
       info          postgres    false    207    6            U           0    0    orders_customerID_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE info."orders_customerID_seq" OWNED BY info.orders.customerid;
          info          postgres    false    206            �            1259    16406    orders_orderID_seq    SEQUENCE     {   CREATE SEQUENCE info."orders_orderID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE info."orders_orderID_seq";
       info          postgres    false    207    6            V           0    0    orders_orderID_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE info."orders_orderID_seq" OWNED BY info.orders.orderid;
          info          postgres    false    205            �           2604    16400    customers customerid    DEFAULT     z   ALTER TABLE ONLY info.customers ALTER COLUMN customerid SET DEFAULT nextval('info."customers_customerID_seq"'::regclass);
 A   ALTER TABLE info.customers ALTER COLUMN customerid DROP DEFAULT;
       info          postgres    false    204    203    204            �           2604    16413    orders orderid    DEFAULT     n   ALTER TABLE ONLY info.orders ALTER COLUMN orderid SET DEFAULT nextval('info."orders_orderID_seq"'::regclass);
 ;   ALTER TABLE info.orders ALTER COLUMN orderid DROP DEFAULT;
       info          postgres    false    205    207    207            �           2604    16414    orders customerid    DEFAULT     t   ALTER TABLE ONLY info.orders ALTER COLUMN customerid SET DEFAULT nextval('info."orders_customerID_seq"'::regclass);
 >   ALTER TABLE info.orders ALTER COLUMN customerid DROP DEFAULT;
       info          postgres    false    206    207    207            �           2606    16405    customers customers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY info.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);
 @   ALTER TABLE ONLY info.customers DROP CONSTRAINT customers_pkey;
       info            postgres    false    204            �           2606    16419    orders orders_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY info.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 :   ALTER TABLE ONLY info.orders DROP CONSTRAINT orders_pkey;
       info            postgres    false    207           