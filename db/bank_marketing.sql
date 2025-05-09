PGDMP      /                }            bank_marketing    16.3    16.3 +               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16425    bank_marketing    DATABASE     �   CREATE DATABASE bank_marketing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Kenya.1252';
    DROP DATABASE bank_marketing;
                postgres    false            �            1259    16447 	   campaigns    TABLE     �   CREATE TABLE public.campaigns (
    campaign_id integer NOT NULL,
    customer_id integer,
    campaign integer,
    pdays integer,
    previous integer,
    poutcome character varying(20)
);
    DROP TABLE public.campaigns;
       public         heap    postgres    false            �            1259    16446    campaigns_campaign_id_seq    SEQUENCE     �   CREATE SEQUENCE public.campaigns_campaign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.campaigns_campaign_id_seq;
       public          postgres    false    220                       0    0    campaigns_campaign_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.campaigns_campaign_id_seq OWNED BY public.campaigns.campaign_id;
          public          postgres    false    219            �            1259    16434    contacts    TABLE     �   CREATE TABLE public.contacts (
    contact_id integer NOT NULL,
    customer_id integer,
    contact_type character varying(20),
    month character varying(10),
    day_of_week character varying(10),
    duration integer
);
    DROP TABLE public.contacts;
       public         heap    postgres    false            �            1259    16433    contacts_contact_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contacts_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.contacts_contact_id_seq;
       public          postgres    false    218                       0    0    contacts_contact_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts.contact_id;
          public          postgres    false    217            �            1259    16427 	   customers    TABLE     )  CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    age integer,
    job character varying(50),
    marital character varying(20),
    education character varying(50),
    default_credit character varying(10),
    housing character varying(10),
    loan character varying(10)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16426    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public          postgres    false    216                       0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    215            �            1259    16459 	   economics    TABLE     �   CREATE TABLE public.economics (
    econ_id integer NOT NULL,
    emp_var_rate numeric,
    cons_price_idx numeric,
    cons_conf_idx numeric,
    euribor3m numeric,
    nr_employed numeric
);
    DROP TABLE public.economics;
       public         heap    postgres    false            �            1259    16458    economics_econ_id_seq    SEQUENCE     �   CREATE SEQUENCE public.economics_econ_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.economics_econ_id_seq;
       public          postgres    false    222                       0    0    economics_econ_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.economics_econ_id_seq OWNED BY public.economics.econ_id;
          public          postgres    false    221            �            1259    16468    subscriptions    TABLE     �   CREATE TABLE public.subscriptions (
    subscription_id integer NOT NULL,
    customer_id integer,
    econ_id integer,
    subscribed character varying(5)
);
 !   DROP TABLE public.subscriptions;
       public         heap    postgres    false            �            1259    16467 !   subscriptions_subscription_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscriptions_subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.subscriptions_subscription_id_seq;
       public          postgres    false    224                       0    0 !   subscriptions_subscription_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.subscriptions_subscription_id_seq OWNED BY public.subscriptions.subscription_id;
          public          postgres    false    223            g           2604    16450    campaigns campaign_id    DEFAULT     ~   ALTER TABLE ONLY public.campaigns ALTER COLUMN campaign_id SET DEFAULT nextval('public.campaigns_campaign_id_seq'::regclass);
 D   ALTER TABLE public.campaigns ALTER COLUMN campaign_id DROP DEFAULT;
       public          postgres    false    220    219    220            f           2604    16437    contacts contact_id    DEFAULT     z   ALTER TABLE ONLY public.contacts ALTER COLUMN contact_id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);
 B   ALTER TABLE public.contacts ALTER COLUMN contact_id DROP DEFAULT;
       public          postgres    false    217    218    218            e           2604    16430    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    216    215    216            h           2604    16462    economics econ_id    DEFAULT     v   ALTER TABLE ONLY public.economics ALTER COLUMN econ_id SET DEFAULT nextval('public.economics_econ_id_seq'::regclass);
 @   ALTER TABLE public.economics ALTER COLUMN econ_id DROP DEFAULT;
       public          postgres    false    222    221    222            i           2604    16471    subscriptions subscription_id    DEFAULT     �   ALTER TABLE ONLY public.subscriptions ALTER COLUMN subscription_id SET DEFAULT nextval('public.subscriptions_subscription_id_seq'::regclass);
 L   ALTER TABLE public.subscriptions ALTER COLUMN subscription_id DROP DEFAULT;
       public          postgres    false    224    223    224                      0    16447 	   campaigns 
   TABLE DATA           b   COPY public.campaigns (campaign_id, customer_id, campaign, pdays, previous, poutcome) FROM stdin;
    public          postgres    false    220   �3       
          0    16434    contacts 
   TABLE DATA           g   COPY public.contacts (contact_id, customer_id, contact_type, month, day_of_week, duration) FROM stdin;
    public          postgres    false    218   p4                 0    16427 	   customers 
   TABLE DATA           m   COPY public.customers (customer_id, age, job, marital, education, default_credit, housing, loan) FROM stdin;
    public          postgres    false    216   �5                 0    16459 	   economics 
   TABLE DATA           q   COPY public.economics (econ_id, emp_var_rate, cons_price_idx, cons_conf_idx, euribor3m, nr_employed) FROM stdin;
    public          postgres    false    222   68                 0    16468    subscriptions 
   TABLE DATA           Z   COPY public.subscriptions (subscription_id, customer_id, econ_id, subscribed) FROM stdin;
    public          postgres    false    224   �8                  0    0    campaigns_campaign_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.campaigns_campaign_id_seq', 57, true);
          public          postgres    false    219                       0    0    contacts_contact_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.contacts_contact_id_seq', 59, true);
          public          postgres    false    217                       0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 59, true);
          public          postgres    false    215                       0    0    economics_econ_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.economics_econ_id_seq', 50, true);
          public          postgres    false    221                        0    0 !   subscriptions_subscription_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.subscriptions_subscription_id_seq', 49, true);
          public          postgres    false    223            o           2606    16452    campaigns campaigns_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (campaign_id);
 B   ALTER TABLE ONLY public.campaigns DROP CONSTRAINT campaigns_pkey;
       public            postgres    false    220            m           2606    16439    contacts contacts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (contact_id);
 @   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
       public            postgres    false    218            k           2606    16432    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    216            q           2606    16466    economics economics_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.economics
    ADD CONSTRAINT economics_pkey PRIMARY KEY (econ_id);
 B   ALTER TABLE ONLY public.economics DROP CONSTRAINT economics_pkey;
       public            postgres    false    222            s           2606    16473     subscriptions subscriptions_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (subscription_id);
 J   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_pkey;
       public            postgres    false    224            u           2606    16453 $   campaigns campaigns_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 N   ALTER TABLE ONLY public.campaigns DROP CONSTRAINT campaigns_customer_id_fkey;
       public          postgres    false    216    220    4715            t           2606    16440 "   contacts contacts_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 L   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_customer_id_fkey;
       public          postgres    false    4715    216    218            v           2606    16474 ,   subscriptions subscriptions_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 V   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_customer_id_fkey;
       public          postgres    false    216    4715    224            w           2606    16479 (   subscriptions subscriptions_econ_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_econ_id_fkey FOREIGN KEY (econ_id) REFERENCES public.economics(econ_id);
 R   ALTER TABLE ONLY public.subscriptions DROP CONSTRAINT subscriptions_econ_id_fkey;
       public          postgres    false    222    224    4721               �   x�u�+�@@A�9�|�%8A,�*4���隝�}�X�u�������x�ǒ
��
S�pU�)�
qf	�>8~p� @P H4H$�I��A� i�4ȟA�+4(ʟ�E��AѠhP܃�AӠi�4h_4�M��4&&&f������iY�/�|�@      
   .  x�u�;R1��x�0��K�Kp'[E�mnϐ�����>��v�ޏ�����|>����{ܟ�Ç�_G�[�|(aU��u�ԀU{iB[�aS�Z��|�UGQɀ��e�a1e �;d b9dD2S&a}@���J�Tl�Xbɉe�X";���.��^,{�A���������}� �\
P�5�2CA]�S(~�v���QWF_Xl�^.5���҅Or�o&�X*i�Ʃ$�.|R[�RL�l�˰>&���$�P��Ž3`��^���=�EC4���2:��%�����?B��\S.��ۛ�?Z��         x  x��Vۮ�0|v��Tm.���}�)9mI�`��o\h�􂄄�=;)�Wp67'/�:¥�V�#|7N�9{�6�OF��I{W�t/�Y�ιk��tp����<�������c���E�<ʠe�1�-�'iV�s�S<�T�E|��5?�9et�孹Y'ߙ��J��n�5]��WT��� ��=kժF�S��ɥ#M�Ȩ�!&�_Y~�PI>�@Ą;�/��m����F�
�(O�=n~ W�XyUV�>u�}�O�}C�u��_ /VBċѤ *<B7'y��4\0$)��7y���cT�\sD��\+�M���A���{�zk�ͻ��8��(-@+lЈ�mYu�֩�#?ʓ�r�.ҏj2�_�Qr'�����K��ؼ�yFѪ+P���r�0�-�~�j�#�S���)&V����a�#gny�7����#>�W)e��̲=�5p�R#?�
��L߄��}T�U�H>Yb���c��]9��o�G[�k��7�uC��%��O}X����<���/}�f@�2�[Fv�mӡa��	�%�j|&l��P����A��6gk[t�(^�����Bpm>�0eN��=�Ҥ���7�!�{E��&&`��A�^�����G{��-��g�炙���<�?y�e���W         �   x��Ի�0 �Z�%B��m��������Z'뜎O�����{lMc�b�X/�7����/gqf.��L,&&����jf5��YͬfV3����jf5�ZX-���i�ZX-�V����je��ZY�/��je��ZY��VV۬�[s�??��         z   x�Mѻ�PDјWb>����9�+mp�#��q��;���Lvr�|O~&���^h�
�@
��
��
����������n�n80��������-��-?�p�p�p��Z���     