PGDMP     3                    {            Shop2    15.1    15.1 =    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    24739    Shop2    DATABASE     {   CREATE DATABASE "Shop2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop2";
                postgres    false            �            1259    24741    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24740    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            D           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    24748    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    24747    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            E           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    24820    order_person    TABLE     �   CREATE TABLE public.order_person (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL
);
     DROP TABLE public.order_person;
       public         heap    postgres    false            �            1259    24819    order_person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.order_person_id_seq;
       public          postgres    false    227            F           0    0    order_person_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_person_id_seq OWNED BY public.order_person.id;
          public          postgres    false    226            �            1259    24755    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    24754    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    219            G           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    218            �            1259    24762    person    TABLE       CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255),
    email character varying(255),
    name_user character varying(255),
    phone_number character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    24761    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    221            H           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    220            �            1259    24771    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    24781    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    24780    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    225            I           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    224            �            1259    24770    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    223            J           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    222            �           2604    24744    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    24751    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    24823    order_person id    DEFAULT     r   ALTER TABLE ONLY public.order_person ALTER COLUMN id SET DEFAULT nextval('public.order_person_id_seq'::regclass);
 >   ALTER TABLE public.order_person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    24758 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    24765 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    24774 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    24784    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            1          0    24741    category 
   TABLE DATA                 public          postgres    false    215   @C       3          0    24748    image 
   TABLE DATA                 public          postgres    false    217   �C       =          0    24820    order_person 
   TABLE DATA                 public          postgres    false    227   @I       5          0    24755    orders 
   TABLE DATA                 public          postgres    false    219   �J       7          0    24762    person 
   TABLE DATA                 public          postgres    false    221   gL       9          0    24771    product 
   TABLE DATA                 public          postgres    false    223   �N       ;          0    24781    product_cart 
   TABLE DATA                 public          postgres    false    225   �e       K           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            L           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 65, true);
          public          postgres    false    216            M           0    0    order_person_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_person_id_seq', 6, true);
          public          postgres    false    226            N           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 10, true);
          public          postgres    false    218            O           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 7, true);
          public          postgres    false    220            P           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 22, true);
          public          postgres    false    224            Q           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 13, true);
          public          postgres    false    222            �           2606    24746    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    24753    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    24825    order_person order_person_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT order_person_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_person DROP CONSTRAINT order_person_pkey;
       public            postgres    false    227            �           2606    24760    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    219            �           2606    24769    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    221            �           2606    24786    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    225            �           2606    24779    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    223            �           2606    24788 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    223            �           2606    24794 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    3218    219    221            �           2606    24804 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    3212    215    223            �           2606    24799 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    223    219    3220            �           2606    24826 (   order_person fkep8v4imh31iqqdxnt5isiuhq2    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_person
    ADD CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2 FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.order_person DROP CONSTRAINT fkep8v4imh31iqqdxnt5isiuhq2;
       public          postgres    false    227    221    3218            �           2606    24789 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    3220    217    223            �           2606    24814 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    223    3220    225            �           2606    24809 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    3218    225    221            1      x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01���ۀ�2�01�b�Ŧ�.l���b����b녽v\�1�� �6VG      3   a  x���ˮd5E��5���Wq'�1�AK$^S�g�"Z���N}@jvU�u�l/��÷?����ۇo�������ky�T?�ۗ���m��6��~��n���c�����u�����7?����%�w�/���a
��%JV�ђ>g]�%�~����/���ۯ�|8B �W�Z;U�ҔB�}R�Z����<i@�UxZ��C�8eT�S�(b*���Ӑ$���,�%2��q��|1��g\�^Ⳑ1�Sv��H5JE�:2yZ�f�b|IOC�~K1c���L�[��ʠ��2&�_��cd܉�1�����:�i$Uk\%t�r��)�b7s�:�' �	3�D�t[)�q�����n֝+�Q$#e���j���H9�x���@F�j,TGG|��,�1�c�c�^���#�}���U�ضU`��M���>-��gnf>fn�T�X�J�%Y�����K��.�͞#�~t��U2�,pmR�2(���57)~E�����n��JZ�L�g�pA�<��<F��w�Sf��Zޑ�7����b.nW��#�~����,���"3pg�+�0B_r�#����X�ΐ.��O�RM����=Gn��X�꽡)7��٨B�S5פ6̯Ğ#�~jj��}��^���� 5cĺz��<Gn��P--�d+x��2��:��2MP%W��#�~z�Vde
��y,t��Dc�(V�+>v�����Ղ�,r.G{.��ǊO�R�^�9Gn�Xoq�;�PP$������%��ں�s�����Ѥ�q�hC]��$&>u�y]�9F�m�9ui�J!68��D+�B�"�b���9r�g�<j)�X�ZG��!C��#j_9�c|�֏��@�ݸ��Xw�b%Ԉ�`n���9�n �m�]��(E��/����ʣ��\:Gn�	n�����@���m�qƦ��9rV+\�*�ئDNنG탋�tE�y7PM�a#��N)c_�=(��1�"���ᘺ%���V������"x�Q��+c���aO`�k�Y�	a������y�D�E�f>��'0��,e��+)/dȲb�̋0Zv��Sj~e蜩�)(w�X�����[ԋ���иLO۶�<�Q�hξh.Ep#ZX�Z���=N�Wc>fnհ�;���c�D���|8����s>	�=�V敍�w((�T+0d�!!d���!zt�(�P'�֙�����X�j�}	ᑢs�޻v܌i�ł�MsO���X~Q;	��#E�̼S����H��~� 5���f�F>)�c�N�,����3El��O�a���.j�?�pμ7�ݤc���#��Z2Y1�9|i������=g�a�}`aP8u�r�畱V{X�>�{�����2֢	��t��'�PL�Iz�v3߼��	��      =   _  x���=k1��~�:۰�hF3#iS�pq����>V���c���G{E0I}��a���e�OϏ?^����9^��RƏ����8���ws����t���m���-��`��R�x:�����k�����뷟�����,9�����D4����\�K���30I� j���6jm�s�ı?��/�����̆�f7z�`��Uh�8�k��#6��!m9g�^�zS/�S0��y�ޱ�k�!Zo]�Yk��l!�-�[�(9��̛�#7��g�7(S�i�����C�\|��5�"��lk�=GB�?܃���~�!b��+Q�Ve��ط)`LT+��t�����ݻ������      5   �  x���=o�0�ݿ��@'���;R�:d0P�@�v�!۰��_�i:�A�.�FJ��G��6�w�����9�����c�'s���)��n�LM��4o_����/y<v�pܖ6=�i>�ڴm�=�㾞��Ʒ���/���w;�&K,9�2P�{���mѪuF��eQl�$8�>���:do/����O��u�#��ٞXU�B��$/c�j.	TGW�5�Gm]����#�_>�������� �zr��R�\�KT�b��|��ł��Rm�:��!q|3���;���]/�]ζ��{�@RlQHn��2A�'�i�Kd���VY�!�#���H=+�ㅠYc���f`�mT#	R���&��Q@��AZ�֑,-=����z`�2��0Q���/���H_��j��.|�      7     x���Kn�@�O�������8$���{ca�d0�캋ޠW��V���ȍ
�9Jݸ���??�'�#��:ֈ8Yފ�]��q�9m"�n<�&b{��E���Q�	7���M ;t�����r(	�.>%&=ŒF�	h-�	=Ԫ��ݤ;ͩ1�1�/y'�(K67�: I}}��L4���ǚ�Sw��,a��ߛ�"-z���������z��P~)���_u%tY�T�u��!��V�V��8u#�V��Y/�g�l�(!���ȥ���7W�w�+sl�	���iUۭ�:<c~,�?ޗߪ����û�k]3{5!�U{|5�W�5��E��ݮ
��K�~Z�C�RMz��站������9�s�J��^���SNEdX���>3G0.�6f�.R�V2�TM�>��š���,v��gƄ^G��z���<�T@ ��� ��`_43�P6�\�g���c�5�s1��;��
�����&]����>�*�_����5.��o�?�7�H      9      x��\KoWv��WT�%���n�Dfe�0����H��-C�̎�Ei$���Ǐ�'A&H�f7Y�$0�����;�֭�nY�������w��(�����y/y����J>��o��X������K.��l$7����zo���q��;�������|tg��|vw�֭�;�dow���/�������ʏ7���}緿޽y9��W_�ڻɥ�F�r��^��\��j%���k����J���Fs�e�6�C����$�ţ�R���0�\�<���l�7����jq����|���_�3�z���|��Y�-~'�N�1�N��8�:���D��ȟq�%�(��7�E7ϰZ���>��V���-ɝ��XV���|/�ȯ�.#K��eEW7��-�.�$�U<��e�~�K�Cy*���zO�P~���"��������=�{�O�N:Xi\<���0)���riq��Pz��HC�\���G�U8��_�'��L%���x$��sg<�,3Si��z�Q&w��AO=�k������P��%�,"��V�������R�r�0Re��O����VJU�SG��W�\h	�U��A:���'���=iFٜ'�����TO�Ӄ���i�I,3����*C*QN��嫾
��M�{j�jH"�s�H\���eT�L�+>�χ���.��X2�����S�*D���ׁ��D�iP��R�]�)�˿=�� ����Ft�����ӊ�"1@����@��&����<�׀��G������-��cѧ:R��ѻ8˱nAu�姐���YA&���W��Gb;܈\cR]uڮ�z��ћ��74��%���PV�V��^[m�����\h����귂/
0��_���b�}.1��݇��a�z�	4��p+"�G���u��U��'}�?��|�����=�cS<�}4"ӯ�%@�~Xwu(OE9�E=�q��� u��pQ��ڛ��[M�zJ���(n��=���s�vZ>esum�}��!g��4[<�����%����-я���㚣��q�n ᙉZ>�O���{��	BH26P�'�߇<��Sq ��w�?�}&��g��[A�x.L��<�����7�91�Fv?�G�!^����ڪa�ʟ���ొ?_�c���g�D�80C̷�P�X�Ah�&�+ˍ)�җΈ� �	����O�#��0/x@�fx�;���O?ũ�N#�O�a �j�����X�8�?̧��$$���zӿhz�܎�2/ъIъ�j�y^�h��3}�w`1������'=��іh���QLIO�c\`Q|��G�J��b��j&@\����6W�ASӃr�����N�������խ��Rƅ��\�;m��^^~_�� �(CP��g��_�3<�+��@#��@>k]�ۗ^�I��z�nom�׶W�+ͫ������fq�^ol���XE�TM�L>/ ��$���@dF4��9с��\i������p`=���i�(a��̻��������?~�[�M�����d���%�x��+B(�'�y�0n�;�ި.񝇄�N�	�'��H��~f���c�����n`���c��Hb`N��8O-AjĊO�|�� ������e��ù�<R�1�p�[
*�<A�8�Z��c�Э#�?
���z��42e	���"�$��w�Vϙ�U���!F�iɕ"kUc�!4RzS�-���2V�U��Ad�u�`�Yu����^��8�Z3��s�)�>��S�99fx�N�����[`���͐ڄ��o��Q)�U���d��H�É�ń�3[�nۤ���N?��7R�T���*/�(�o��cLX�^ӛ�/)	?d����4��(H6���a�,��s�~�+-)�TP�i[6^�|�  h�T�4���ʚ*՝���L�2���AB"b�Vm��3�j��:4d��a�u�ז��)��U�u'[8�b`�;�ܢ"k'�n�^�P|��+�L�^���u�.A�Y�%ot(4�z5�l>ON�,T!!��(���P@�=W�c$��.�B�ہr�z�Q���:t6����_��>Dr␯��YhI��%�4
�i#��8��hD�O��\��+�{�6�ʐ�/7����?L��%�)i�(e!�V͔)c�(aTR��'䍍6��_���͵֚г�u���J�~[����jo�uk����%�#�m,*
[�ِ��*�m7��[۫�+�[���:��RX5�G�nc�ogbPޘ�ϲ�?D� 4�! F�1���&�X'�z����YYR$|p
Gb	Z}1E9ϸ2��ꀖ��~,�s3P��,Gr��e�jB(FB�� B�%��эO<�&Ah}�jd.d<]~�;�q���L�䷌�'��WMi�c(�	j��Ӄ��P��:!����%E`��3���i��[�4�"���v�'��x,a��D���ݦq [(�%�^��@#�r�g�m1��X�(�Y��,�9E�8��Y ���.�-���'S�A��;��[�y�ҙZXf��;t��1��۳��Q���k��hp�Q�ԕ:�׊�E<�z\��z��3C��S��f�R��F��\\_�u�Ûk�&.�K�Φp�u�S��o��3�mO��⠨�}?�`V���%S���ྉ��:�-�5��9�kx�Cbʘ�9���؞Cy6����V�}�9��e9�Q������08}"��/���v޷���GY�\��<y�s��j����ۏM/�;&<sT���"�!�iVY�ps1ꝲEu� i{�5Lp2������+��h�5z����eѐl�;O����H2�b�L�Ĳ��D�� vy��EE���X@���<D6��$:�!��U��ua��t�"NDA�
S��z\V������)W,׆C�%^�3�?�11-�v/��f���3z��ݏ��JH�Ѵ��Y���ϛQ�D�~�$��������Zjf�Ү�c�.��p����1D��$M�_+����T��,��:��޳��#24�2��|w!���7?�|�����qm]I.�R�kwv>ع�Ԙ�r;\+����O�R��Xjku�yuE�Y[����G��"u��q�ɴ>)-���y�a��KNY�PjY�v[#�05�|Ed��uj7!�:7�iY+�52���W��Q���i5"~
=%�0���,�b��!��6��^W�9[����~x~�-_���^S�I��Y�oH�������_�ʮ�ܽy��6�V~6�j�[���jk����jo�>_yM�ֶF��W�H<(�	rR�N�V���[���^�`���Q.nh|;O#'�J|��}��f��������گ4ϢFQ\�Ci��M�j7�X|��qV�<�������g4݈��P��;6��	��c��GV���}.*x���ؒ���[{;7�����!�)�.+�X�G�- 뭼�J�q�'�Ժ��3�t�6�M:@�*+����Cq⡷mb}���}�����2��38� ~�-V8��~����j��m0���"E��ό���N�a:�J�# S�Q���2�� "=��r�����@C�����jP{�&6�(ݝ��S��+KU�yV>�^�q�ny��%-�g�'e�ey�RC�����6	��j.���^��~4��-j��S�����3�Ď����G�P��(�y��rf\e�Xӹg�K��6����{Φ��!R���3O.���/�N���o��Ԉ=y%�h�;Z��	��� �}��ƾ����/c��ն�fS,��""5����޾}���ݻ/�`�:D	)������wo��k����o���;��{yIt[��[k>�ml�n�lnll�ɧ�0)��o=+�+X�U����*�9sM�e=Ѓh������ק�[�:Le2��IG9 �H�.#�T�o$aV���C~�a$@Q?p�QE�r3���jc��c|�Z�,j%D�6'Ipc�m׮�:7Nme��u4��Hm�?,��>�DK��|��jf9��aÜ��i���`�q���N�^��3�%���).�2 l �  ���-������;q(:��B,����"1D����~�lZi����q4��o�vT��9=����1��f��&�͔����A��9�x¦%��Ľ8���Sj�f ���*f�SHL������>��)5�0\����Ց���ts�8b���5��9�E�a��"���*h)`y�,��y�:?���g6��t�Hb�uK+��}j��ib1G1�������-�]�`��K��Gʋ���Ě�����_]��eNne�j�~�a̠^�����uB�-�BQnH��D�(`��Nho׊�Q��I�g6B�\}���l\p��SضJ�w�fQ3�7dJ���|̻aV�(�9.��?�����򧒲���o��|��C���G?�^($��ߤu�	?���T�"�WQ���*G����S�lt@�Z����b�G]+K$"0YH�Uz�ׇ�B|��WW��`x���:�MV��7���j���6/`�<��q�0sl22e1�m��QmBCf����C�XV�:g��K��6L�{�@̱!b9[a����N핌>��bOZ�6��A݈-�gT�X�g�u�{��^��d��{U�lA��P5D {]�+�a��i�K<�-F���J��t3:�-���ID¸��>>�-�s�䄯�PZq{<��t�}"�޹+� �|�\xy�ꈽ����||�Hl�
�Y���p�37�Z9�m�*[j*s@ua�Ա�	��^���+C{e?��\�)�k}@���N���]��<�y��ާ�k��z&V����!�3�c���1Ґ�>2q����b�>�bP��d�c7��J�\����X��{J����ء��e$Q���]krԐ�q�U�7������I���P/>��������WBE֛Zc}�n��ۻ������O�~6�捒!=o�\�tq�z�^k��&!eP 	ʀ�r6T����B�^*RB�j�\L9���.�G���p *��PSBPT�
eF��G;���(㬾�97B5FO=�6 "���$ q�s������� O<W����΢w���*N(��5��3���90L|������Ѥ,��"�"4��j	X��3+�����3�zWs� z�W�|`8���Q�uV�s��:�QT^2��}�)*��.�#��3W�
�pbd-���2�YZy�(Fn� fU���U��i
��/;�>z{�v��;�r�۶�����!����}��W��X`8��TG[�%�4
/�����Z9�U��W������g�ͤ˧�~h~�D�E�7\:��B�FX<��c�k���cL�>s��x� �]�?����jT!oo&�M��n�l�����0|SfJ�d�h� ����믾��"X��)�����\Q*k���j?Q���l�Ws�|�͙L���������)j�S�5#�i!*1c�{�+XQM?����<�1���D �A
�>��WY�v­iULV�W����*����4a�/���x�bb=(ـS�R�����ڦU����=��NK��� Se̖�G�G�F�o��0iC�\�W3��jc��^�r^�����ac�U��3g�5���AzK�9M��Ճ�q�Wf�&a믅��B��Q�x�<"t�9�)Sk@��4�����
����:ፋĉ�P��^#x�(�g/�m����:�]��'A,	>a���Y��� �m0V:?xg`�e>�|>�������P��>��n���A�X�|���W�\m&�LZ��ڕf�9E�^�?�׃      ;   O   x���v
Q���W((M��L�+(�O)M.�ON,*Q��L�Q(H-*�ϋ3���)�
a�>���
��:
&@�i��� _�     